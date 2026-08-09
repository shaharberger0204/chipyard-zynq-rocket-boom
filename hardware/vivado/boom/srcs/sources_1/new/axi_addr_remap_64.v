module axi_addr_remap_64 (
    input  wire         aclk,
    input  wire         aresetn,

    // S_AXI: from Rocket
    input  wire         s_axi_awvalid,
    output wire         s_axi_awready,
    input  wire [3:0]   s_axi_awid,
    input  wire [31:0]  s_axi_awaddr,
    input  wire [7:0]   s_axi_awlen,
    input  wire [2:0]   s_axi_awsize,
    input  wire [1:0]   s_axi_awburst,
    input  wire         s_axi_awlock,
    input  wire [3:0]   s_axi_awcache,
    input  wire [2:0]   s_axi_awprot,
    input  wire [3:0]   s_axi_awqos,

    input  wire         s_axi_wvalid,
    output wire         s_axi_wready,
    input  wire [63:0]  s_axi_wdata,
    input  wire [7:0]   s_axi_wstrb,
    input  wire         s_axi_wlast,

    output wire         s_axi_bvalid,
    input  wire         s_axi_bready,
    output wire [3:0]   s_axi_bid,
    output wire [1:0]   s_axi_bresp,

    input  wire         s_axi_arvalid,
    output wire         s_axi_arready,
    input  wire [3:0]   s_axi_arid,
    input  wire [31:0]  s_axi_araddr,
    input  wire [7:0]   s_axi_arlen,
    input  wire [2:0]   s_axi_arsize,
    input  wire [1:0]   s_axi_arburst,
    input  wire         s_axi_arlock,
    input  wire [3:0]   s_axi_arcache,
    input  wire [2:0]   s_axi_arprot,
    input  wire [3:0]   s_axi_arqos,

    output wire         s_axi_rvalid,
    input  wire         s_axi_rready,
    output wire [3:0]   s_axi_rid,
    output wire [63:0]  s_axi_rdata,
    output wire [1:0]   s_axi_rresp,
    output wire         s_axi_rlast,

    // M_AXI: to AXI Clock Converter / PS
    output wire         m_axi_awvalid,
    input  wire         m_axi_awready,
    output wire [3:0]   m_axi_awid,
    output wire [31:0]  m_axi_awaddr,
    output wire [7:0]   m_axi_awlen,
    output wire [2:0]   m_axi_awsize,
    output wire [1:0]   m_axi_awburst,
    output wire         m_axi_awlock,
    output wire [3:0]   m_axi_awcache,
    output wire [2:0]   m_axi_awprot,
    output wire [3:0]   m_axi_awqos,

    output wire         m_axi_wvalid,
    input  wire         m_axi_wready,
    output wire [63:0]  m_axi_wdata,
    output wire [7:0]   m_axi_wstrb,
    output wire         m_axi_wlast,

    input  wire         m_axi_bvalid,
    output wire         m_axi_bready,
    input  wire [3:0]   m_axi_bid,
    input  wire [1:0]   m_axi_bresp,

    output wire         m_axi_arvalid,
    input  wire         m_axi_arready,
    output wire [3:0]   m_axi_arid,
    output wire [31:0]  m_axi_araddr,
    output wire [7:0]   m_axi_arlen,
    output wire [2:0]   m_axi_arsize,
    output wire [1:0]   m_axi_arburst,
    output wire         m_axi_arlock,
    output wire [3:0]   m_axi_arcache,
    output wire [2:0]   m_axi_arprot,
    output wire [3:0]   m_axi_arqos,

    input  wire         m_axi_rvalid,
    output wire         m_axi_rready,
    input  wire [3:0]   m_axi_rid,
    input  wire [63:0]  m_axi_rdata,
    input  wire [1:0]   m_axi_rresp,
    input  wire         m_axi_rlast
);

    // Clear bit 31:
    // Rocket 0x80000000 - 0xBFFFFFFF becomes PS 0x40000000 - 0x7FFFFFFF.
    wire [31:0] remap_awaddr = {1'b0, s_axi_awaddr[30:0]} + 32'h4000_0000;
    wire [31:0] remap_araddr = {1'b0, s_axi_araddr[30:0]} + 32'h4000_0000;

    // Write address
    assign m_axi_awvalid = s_axi_awvalid;
    assign s_axi_awready = m_axi_awready;
    assign m_axi_awid    = s_axi_awid;
    assign m_axi_awaddr  = remap_awaddr;
    assign m_axi_awlen   = s_axi_awlen;
    assign m_axi_awsize  = s_axi_awsize;
    assign m_axi_awburst = s_axi_awburst;
    assign m_axi_awlock  = s_axi_awlock;
    assign m_axi_awcache = s_axi_awcache;
    assign m_axi_awprot  = s_axi_awprot;
    assign m_axi_awqos   = s_axi_awqos;

    // Write data
    assign m_axi_wvalid = s_axi_wvalid;
    assign s_axi_wready = m_axi_wready;
    assign m_axi_wdata  = s_axi_wdata;
    assign m_axi_wstrb  = s_axi_wstrb;
    assign m_axi_wlast  = s_axi_wlast;

    // Write response
    assign s_axi_bvalid = m_axi_bvalid;
    assign m_axi_bready = s_axi_bready;
    assign s_axi_bid    = m_axi_bid;
    assign s_axi_bresp  = m_axi_bresp;

    // Read address
    assign m_axi_arvalid = s_axi_arvalid;
    assign s_axi_arready = m_axi_arready;
    assign m_axi_arid    = s_axi_arid;
    assign m_axi_araddr  = remap_araddr;
    assign m_axi_arlen   = s_axi_arlen;
    assign m_axi_arsize  = s_axi_arsize;
    assign m_axi_arburst = s_axi_arburst;
    assign m_axi_arlock  = s_axi_arlock;
    assign m_axi_arcache = s_axi_arcache;
    assign m_axi_arprot  = s_axi_arprot;
    assign m_axi_arqos   = s_axi_arqos;

    // Read data
    assign s_axi_rvalid = m_axi_rvalid;
    assign m_axi_rready = s_axi_rready;
    assign s_axi_rid    = m_axi_rid;
    assign s_axi_rdata  = m_axi_rdata;
    assign s_axi_rresp  = m_axi_rresp;
    assign s_axi_rlast  = m_axi_rlast;

endmodule