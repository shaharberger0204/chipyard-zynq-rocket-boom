`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: iWave Systems Technologies
// Engineer: Sahana S Nayak
// 
// Create Date: 28.03.2022 09:40:22
// Design Name: 4EG R2.C Standard Release
// Module Name: system
// Project Name: 4EG-1I-R2C-UD20-21_1-F1_0
// Target Devices: XCZU4EG-FBVB900-1-I
// Tool Versions: 2021.1
// Description: FPGA design with PS Peripherals, SDI, PL DDR, PL DNA and GPIOs
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module system(
    // PS Peripherals
    inout           [0:0]       dp_aux_n,
    inout           [0:0]       dp_aux_p,
    input                       dp_hpd,
    output                      gem_3_mdio_mdc,
    inout                       gem_3_mdio_mdio_io,
    input   wire                usb_int,
    input   wire                gem_3_int,
    input   wire                pcie_wake,
    output                      usb_sw,
    output                      can_0_pwr_dwn,
    output                      gem_3_rst,
    output                      pcie_rst,
    
    // SDI
    input           [0:0]       sdi_refclk_clk_n,
    input           [0:0]       sdi_refclk_clk_p,
    input                       sdi_rxn,
    input                       sdi_rxp,
    output                      sdi_txn,
    output                      sdi_txp,
    
    // 10G Ethernet
    input                       eth_10g_rxp,
    input                       eth_10g_rxn,
    output                      eth_10g_txp,
    output                      eth_10g_txn,
    input                       eth_10g_refclk_p,
    input                       eth_10g_refclk_n,
    
    // PL DDR4
    input                       ddr4_sysclk_clk_n,
    input                       ddr4_sysclk_clk_p,
    output                      ddr4_act_n,
    output          [16:0]      ddr4_adr,
    output          [1:0]       ddr4_ba,
    output          [0:0]       ddr4_bg,
    output          [0:0]       ddr4_ck_c,
    output          [0:0]       ddr4_ck_t,
    output          [0:0]       ddr4_cke,
    output          [0:0]       ddr4_cs_n,
    output          [0:0]       ddr4_odt,
    output                      ddr4_reset_n,
    inout           [1:0]       ddr4_dm_n,
    inout           [15:0]      ddr4_dq,
    inout           [1:0]       ddr4_dqs_c,
    inout           [1:0]       ddr4_dqs_t,

    // GPIOs
    input           [1:0]       board_config_gpio_tri_i,
    inout           [31:0]      fmc1_gpio_1_tri_io,
    inout           [31:0]      fmc1_gpio_2_tri_io,
    inout           [7:0]       fmc1_gpio_3_tri_io,
    inout           [19:0]      fmc2_gpio_1_tri_io,
    inout           [19:0]      fmc2_gpio_2_tri_io,
    inout           [7:0]       pmod_gpio_1_tri_io,
    inout           [7:0]       pmod_gpio_2_tri_io
);
 
// ------------------------------- EMIO GPIO Assignments ------------------------------  
wire    [9:0]			    emio_gpio_i;
wire    [9:0]		        emio_gpio_o;
  
assign  emio_gpio_i[0]  =   usb_int;
assign  emio_gpio_i[4]  =   gem_3_int;
assign  emio_gpio_i[5]  =   pcie_wake;
assign  usb_sw          =   emio_gpio_o[1];
assign  can_0_pwr_dwn   =   emio_gpio_o[2];
assign  gem_3_rst       =   emio_gpio_o[3];
assign  pcie_rst        =   emio_gpio_o[6];
// ------------------------------------------------------------------------------------

// --------------------------- 10G Ethernet Serial Interface -------------------------- 
wire                        gt_rxp_int_0;
wire                        gt_rxn_int_0;
wire                        gt_txp_int_0;
wire                        gt_txn_int_0;
assign  gt_rxp_int_0    =   eth_10g_rxp;
assign  gt_rxn_int_0    =   eth_10g_rxn;
assign  gt_txp_int_0    =   eth_10g_txp;
assign  gt_txn_int_0    =   eth_10g_txn;
// ------------------------------------------------------------------------------------

// ---------------------------- 10G Ethernet Clock Signals ----------------------------
wire                        dclk;
wire                        s_axi_aclk_0;
wire                        tx_clk_out_0;
wire                        rx_clk_out_0;
wire                        rx_serdes_clk_0;
//wire                        tx_core_clk_0;
wire                        rx_core_clk_0;
wire                        gt_refclk_out;
assign  rx_core_clk_0   =   rx_clk_out_0;
assign  dclk            =   s_axi_aclk_0;
// ------------------------------------------------------------------------------------

// ---------------------------- 10G Ethernet Reset Signals ----------------------------
wire                        sys_reset;
wire                        ctl_gt_reset_all_0;
wire                        ctl_gt_tx_reset_0;
wire                        ctl_gt_rx_reset_0;
wire                        gtwiz_reset_tx_done_0;
wire                        gtwiz_reset_rx_done_0;
wire                        rx_serdes_reset_0;
wire                        tx_reset_0;
wire                        rx_reset_0;
wire                        rx_core_reset_0;
wire                        tx_core_reset_0;
wire                        user_tx_reset_0;
wire                        user_rx_reset_0;
wire                        gtwiz_reset_all_0;
wire                        gtwiz_reset_tx_datapath_out_0;
wire                        gtwiz_reset_rx_datapath_out_0;
wire                        pl_resetn0;
wire                        gtwiz_reset_tx_datapath_0;
wire                        gtwiz_reset_rx_datapath_0;
assign gtwiz_reset_tx_datapath_0 =  ~pl_resetn0;
assign gtwiz_reset_rx_datapath_0 =  ~pl_resetn0;
// ------------------------------------------------------------------------------------

// ------------------------- GTH Quad 226 GT Common Signals ---------------------------  
wire                        gtrefclk_10g;  
wire                        qpll0lock;     
wire                        qpll0outclk;  
wire                        qpll0outrefclk;  
wire                        qpll0reset;
wire                        gtrefclk_sdi;
wire                        qpll1lock;     
wire                        qpll1outclk;  
wire                        qpll1outrefclk;  
wire                        qpll1reset;
wire                        qpll1lock_int;     
wire                        qpll1outclk_int;  
wire                        qpll1outrefclk_int;  
wire                        qpll1reset_int;
// ------------------------------------------------------------------------------------

// -------------------------- 10G Ethernet GT TX Interface ----------------------------
wire    [127:0]             tx_serdes_data_in_0;
wire    [5:0]               txheader_in_0;
// ------------------------------------------------------------------------------------

// -------------------------- 10G Ethernet GT RX Interface ----------------------------
wire    [0:0]               rxgearboxslip_in_0;
wire    [1:0]               rxdatavalid_out_0;
wire    [5:0]               rxheader_out_0;
wire    [1:0]               rxheadervalid_out_0;
wire    [127:0]             rx_serdes_data_out_0;
// ------------------------------------------------------------------------------------

// ----------------------- 10G Ethernet GT DRP interface signals ----------------------
wire    [15:0]              gt_drpdo_0;
wire    [0:0]               gt_drprdy_0;
wire    [0:0]               gt_drpen_0;
wire    [0:0]               gt_drpwe_0;
wire    [9:0]               gt_drpaddr_0;
wire    [15:0]              gt_drpdi_0;
// ------------------------------------------------------------------------------------

// -------------------------- 10G Ethernet GT Control Signals -------------------------
wire                        gt_loopback_out_0;
wire                        rxrecclkout_0;
wire                        gtpowergood_out_0;
wire    [2:0]               txoutclksel_in_0;
wire    [2:0]               rxoutclksel_in_0;
assign  txoutclksel_in_0 =  3'b101;    // this value should not be changed as per gtwizard 
assign  rxoutclksel_in_0 =  3'b101;    // this value should not be changed as per gtwizard
// ------------------------------------------------------------------------------------

// ---------------- 10G Ethernet GT Transceiver debug interface signals ---------------
wire    [16:0]              gt_dmonitorout_0;
wire    [0:0]               gt_eyescandataerror_0;
wire    [0:0]               gt_eyescanreset_0;
wire    [0:0]               gt_eyescantrigger_0;
wire    [15:0]              gt_pcsrsvdin_0;
wire    [0:0]               gt_rxbufreset_0;
wire    [2:0]               gt_rxbufstatus_0;
wire    [0:0]               gt_rxcdrhold_0;
wire    [0:0]               gt_rxcommadeten_0;
wire    [0:0]               gt_rxdfeagchold_0;
wire    [0:0]               gt_rxdfelpmreset_0;
wire    [0:0]               gt_rxlatclk_0;
wire    [0:0]               gt_rxlpmen_0;
wire    [0:0]               gt_rxpcsreset_0;
wire    [0:0]               gt_rxpmareset_0;
wire    [0:0]               gt_rxpolarity_0;
wire    [0:0]               gt_rxprbscntreset_0;
wire    [0:0]               gt_rxprbserr_0;
wire    [3:0]               gt_rxprbssel_0;
wire    [2:0]               gt_rxrate_0;
wire    [0:0]               gt_rxslide_in_0;
wire    [1:0]               gt_rxstartofseq_0;
wire    [1:0]               gt_txbufstatus_0;
wire    [0:0]               gt_txinhibit_0;
wire    [0:0]               gt_txlatclk_0;
wire    [6:0]               gt_txmaincursor_0;
wire    [0:0]               gt_txpcsreset_0;
wire    [0:0]               gt_txpmareset_0;
wire    [0:0]               gt_txpolarity_0;
wire    [4:0]               gt_txpostcursor_0;
wire    [0:0]               gt_txprbsforceerr_0;
wire    [0:0]               gt_txelecidle_0;
wire    [3:0]               gt_txprbssel_0;
wire    [4:0]               gt_txprecursor_0;
wire    [4:0]               gt_txdiffctrl_0;
// ------------------------------------------------------------------------------------

// ====================================================================================
// Block Design Wrapper Instance
// ====================================================================================
design_1_wrapper design_1_wrapper_0(

    // PS Peripherals
    .dp_aux_n                                   (dp_aux_n               ),
    .dp_aux_p                                   (dp_aux_p               ),
    .dp_hpd                                     (dp_hpd                 ),
    .emio_gpio_i                                (emio_gpio_i            ),
    .emio_gpio_o                                (emio_gpio_o            ),
    .gem_3_mdio_mdc                             (gem_3_mdio_mdc         ),
    .gem_3_mdio_mdio_io                         (gem_3_mdio_mdio_io     ),
    
    // 10G Ethernet
    .ctl_gt_reset_all_0                         (ctl_gt_reset_all_0     ),
    .ctl_gt_rx_reset_0                          (ctl_gt_rx_reset_0      ),
    .ctl_gt_tx_reset_0                          (ctl_gt_tx_reset_0      ),
    .gt_loopback_out_0                          (gt_loopback_out_0      ),
    .gt_rx_serdes_interface_0_ch_rxdata         (rx_serdes_data_out_0   ),
    .gt_rx_serdes_interface_0_ch_rxdatavalid    (rxdatavalid_out_0      ),
    .gt_rx_serdes_interface_0_ch_rxgearboxslip  (rxgearboxslip_in_0     ),
    .gt_rx_serdes_interface_0_ch_rxheader       (rxheader_out_0         ),
    .gt_rx_serdes_interface_0_ch_rxheadervalid  (rxheadervalid_out_0    ),
    .gt_tx_serdes_interface_0_ch_txdata         (tx_serdes_data_in_0    ),
    .gt_tx_serdes_interface_0_ch_txheader       (txheader_in_0          ),
    .gtwiz_reset_rx_done_0                      (gtwiz_reset_rx_done_0  ),
    .gtwiz_reset_tx_done_0                      (gtwiz_reset_tx_done_0  ),
    .peripheral_reset_125M                      (sys_reset              ),
    .pl_resetn0                                 (pl_resetn0             ),
    .rx_clk_out_0                               (rx_clk_out_0           ),
    .rx_serdes_clk_0                            (rx_serdes_clk_0        ),
    .rx_serdes_reset_0                          (rx_serdes_reset_0      ),
    .s_axi_aclk_0                               (s_axi_aclk_0           ),
    .tx_clk_out_0                               (tx_clk_out_0           ),
//    .tx_core_clk_0                              (tx_core_clk_0          ),
    .user_rx_reset                              (user_rx_reset_0        ),
    .user_tx_reset                              (user_tx_reset_0        ),
    .rx_reset_0                                 (rx_core_reset_0        ),
    .tx_reset_0                                 (tx_core_reset_0        ),           
    .rx_reset                                   (rx_reset_0             ),
    .tx_reset                                   (tx_reset_0             ),
    
    // SDI
    .sdi_rxn                                    (sdi_rxn                ),
    .sdi_rxp                                    (sdi_rxp                ),
    .sdi_txn                                    (sdi_txn                ),
    .sdi_txp                                    (sdi_txp                ),
    .intf_0_qpll1lock_in                        (qpll1lock              ),
    .intf_0_qpll1out_clk_in                     (qpll1outclk            ),
    .intf_0_qpll1out_refclk_in                  (qpll1outrefclk         ),
    .intf_0_qpll1reset_out                      (qpll1reset             ),
    
    // PL DDR4
    .ddr4_sysclk_clk_n                          (ddr4_sysclk_clk_n      ),
    .ddr4_sysclk_clk_p                          (ddr4_sysclk_clk_p      ),
    .ddr4_act_n                                 (ddr4_act_n             ),
    .ddr4_adr                                   (ddr4_adr               ),
    .ddr4_ba                                    (ddr4_ba                ),
    .ddr4_bg                                    (ddr4_bg                ),
    .ddr4_ck_c                                  (ddr4_ck_c              ),
    .ddr4_ck_t                                  (ddr4_ck_t              ),
    .ddr4_cke                                   (ddr4_cke               ),
    .ddr4_cs_n                                  (ddr4_cs_n              ),
    .ddr4_odt                                   (ddr4_odt               ),
    .ddr4_reset_n                               (ddr4_reset_n           ),
    .ddr4_dm_n                                  (ddr4_dm_n              ),
    .ddr4_dq                                    (ddr4_dq                ),
    .ddr4_dqs_c                                 (ddr4_dqs_c             ),
    .ddr4_dqs_t                                 (ddr4_dqs_t             ),

    // GPIOs
    .board_config_gpio_tri_i                    (board_config_gpio_tri_i),
    .fmc1_gpio_1_tri_io                         (fmc1_gpio_1_tri_io     ),
    .fmc1_gpio_2_tri_io                         (fmc1_gpio_2_tri_io     ),
    .fmc1_gpio_3_tri_io                         (fmc1_gpio_3_tri_io     ),
    .fmc2_gpio_1_tri_io                         (fmc2_gpio_1_tri_io     ),
    .fmc2_gpio_2_tri_io                         (fmc2_gpio_2_tri_io     ),
    .pmod_gpio_1_tri_io                         (pmod_gpio_1_tri_io     ),
    .pmod_gpio_2_tri_io                         (pmod_gpio_2_tri_io     )
);

// ====================================================================================
// 10G Ethernet GT Wizard Wrapper Instance
// ====================================================================================
xxv_ethernet_0_gt_wrapper_0 i_xxv_ethernet_0_gt_wrapper_0 (
    .gt_rxp_in                  (gt_rxp_int_0                   ),
    .gt_rxn_in                  (gt_rxn_int_0                   ),
    .gt_txp_out                 (gt_txp_int_0                   ),
    .gt_txn_out                 (gt_txn_int_0                   ),
    .tx_clk_out                 (tx_clk_out_0                   ),
    .rx_clk_out                 (rx_clk_out_0                   ),
    .gt_loopback_in             ({1'b0,gt_loopback_out_0,1'b0}  ),
    .gtwiz_reset_all            (gtwiz_reset_all_0              ),
    .rxrecclkout                (rxrecclkout_0                  ),
    .gtwiz_reset_tx_datapath    (gtwiz_reset_tx_datapath_out_0  ),
    .gtwiz_reset_rx_datapath    (gtwiz_reset_rx_datapath_out_0  ),
    .gtpowergood_out            (gtpowergood_out_0              ),

    //GT Transceiver debug interface ports
    .gt_dmonitorout             (gt_dmonitorout_0               ),
    .gt_eyescandataerror        (gt_eyescandataerror_0          ),
    .gt_eyescanreset            (gt_eyescanreset_0              ),
    .gt_eyescantrigger          (gt_eyescantrigger_0            ),
  
    .gt_pcsrsvdin               (gt_pcsrsvdin_0                 ),
    .gt_rxbufreset              (gt_rxbufreset_0                ),
    .gt_rxbufstatus             (gt_rxbufstatus_0               ),
    .gt_rxcdrhold               (gt_rxcdrhold_0                 ),
  
    .gt_rxcommadeten            (gt_rxcommadeten_0              ),
    .gt_rxdfeagchold            (gt_rxdfeagchold_0              ),
    .gt_rxdfelpmreset           (gt_rxdfelpmreset_0             ),
    .gt_rxlatclk                (gt_rxlatclk_0                  ),
  
    .gt_rxlpmen                 (gt_rxlpmen_0                   ),
    .gt_rxpcsreset              (gt_rxpcsreset_0                ),
    .gt_rxpmareset              (gt_rxpmareset_0                ),
    .gt_rxpolarity              (gt_rxpolarity_0                ),
  
    .gt_rxprbscntreset          (gt_rxprbscntreset_0            ),
    .gt_rxprbserr               (gt_rxprbserr_0                 ),
    .gt_rxprbssel               (gt_rxprbssel_0                 ),
    .gt_rxrate                  (gt_rxrate_0                    ),
  
    .gt_rxslide_in              (gt_rxslide_in_0                ),
    .gt_rxstartofseq            (gt_rxstartofseq_0              ),
    .gt_txbufstatus             (gt_txbufstatus_0               ),
    .gt_txdiffctrl              (gt_txdiffctrl_0                ),
  
    .gt_txinhibit               (gt_txinhibit_0                 ),
    .gt_txlatclk                (gt_txlatclk_0                  ),
    .gt_txmaincursor            (gt_txmaincursor_0              ),
    .gt_txpcsreset              (gt_txpcsreset_0                ),
  
    .gt_txpmareset              (gt_txpmareset_0                ),
    .gt_txpolarity              (gt_txpolarity_0                ),
    .gt_txpostcursor            (gt_txpostcursor_0              ),
    .gt_txprbsforceerr          (gt_txprbsforceerr_0            ),
  
    .gt_txelecidle              (gt_txelecidle_0                ),
    .gt_txprbssel               (gt_txprbssel_0                 ),
    .gt_txprecursor             (gt_txprecursor_0               ),
  
    .txoutclksel_in             (txoutclksel_in_0               ),
    .rxoutclksel_in             (rxoutclksel_in_0               ),

    //GT DRP ports 
    .gt_drpclk                  (dclk                           ),
    .gt_drpdo                   (gt_drpdo_0                     ),
    .gt_drprdy                  (gt_drprdy_0                    ),
    .gt_drpen                   (gt_drpen_0                     ),
    .gt_drpwe                   (gt_drpwe_0                     ),
    .gt_drpaddr                 (gt_drpaddr_0                   ),
    .gt_drpdi                   (gt_drpdi_0                     ),
    .gt_drprst                  (1'b0                           ),

    .gtwiz_reset_tx_done        (gtwiz_reset_tx_done_0          ),
    .gtwiz_reset_rx_done        (gtwiz_reset_rx_done_0          ),
    .rx_serdes_clk              (rx_serdes_clk_0                ),
//    .tx_core_clk                (tx_core_clk_0                  ),

    .rxgearboxslip_in           (rxgearboxslip_in_0             ),
    .rxdatavalid_out            (rxdatavalid_out_0              ),
    .rxheader_out               (rxheader_out_0                 ),
    .rxheadervalid_out          (rxheadervalid_out_0            ),
    .rx_serdes_data_out         (rx_serdes_data_out_0           ),
    .tx_serdes_data_in          (tx_serdes_data_in_0            ),
    .txheader_in                (txheader_in_0                  ),

    //  Ports present when shared logic is implemented outside core
    .qpll0clk_in                (qpll0outclk                    ),
    .qpll0refclk_in             (qpll0outrefclk                 ),
    .qpll1clk_in                (qpll1outclk_int                ),
    .qpll1refclk_in             (qpll1outrefclk_int             ),
    .gtwiz_reset_qpll0lock_in   (qpll0lock                      ),
    .gtwiz_reset_qpll0reset_out (qpll0reset                     ),
    .gtwiz_reset_qpll1lock_in   (qpll1lock_int                  ),
    .gtwiz_reset_qpll1reset_out (qpll1reset_int                 ),
    .sys_reset                  (sys_reset                      ),
    .dclk                       (dclk                           )
);

// ====================================================================================
// Clocking Wrapper
// ====================================================================================
xxv_ethernet_0_clocking_wrapper i_xxv_ethernet_0_clocking_wrapper(
    .gt_refclk_p    (eth_10g_refclk_p   ),
    .gt_refclk_n    (eth_10g_refclk_n   ),
    .gt_refclk_out  (gt_refclk_out      ),
    .gt_refclk      (gtrefclk_10g          )
);
    
// ====================================================================================
// GT Common Wrapper Instance
// ====================================================================================
IBUFDS_GTE4 #(
    .REFCLK_EN_TX_PATH  (1'b0),
    .REFCLK_HROW_CK_SEL (2'b00),
    .REFCLK_ICNTL_RX    (2'b00)
) IBUFDS_GTE4_MGTREFCLK0_INST (
    .I     (sdi_refclk_clk_p),
    .IB    (sdi_refclk_clk_n),
    .CEB   (1'b0),
    .O     (gtrefclk_sdi),
    .ODIV2 ()
);

gt_common gt_common_inst(
    // SDI
    .qpll1reset_in      (qpll1reset     ),
    .gtrefclk_sdi       (gtrefclk_sdi   ),
    .qpll1lock_out      (qpll1lock      ),
    .qpll1outclk_out    (qpll1outclk    ),
    .qpll1outrefclk_out (qpll1outrefclk ),
    // 10G Ethernet
    .qpll0reset_in      (qpll0reset     ),
    .gtrefclk_10g       (gtrefclk_10g   ),
    .qpll0lock_out      (qpll0lock      ),
    .qpll0outclk_out    (qpll0outclk    ),
    .qpll0outrefclk_out (qpll0outrefclk )
);

// ====================================================================================
// 10G Ethernet Reset Wrapper Instance
// ====================================================================================
xxv_ethernet_0_reset_wrapper i_xxv_ethernet_0_reset_wrapper_0(
    .s_axi_aclk                     (s_axi_aclk_0                   ),
    .ctl_gt_reset_all               (ctl_gt_reset_all_0             ),
    .ctl_gt_tx_reset                (ctl_gt_tx_reset_0              ),
    .ctl_gt_rx_reset                (ctl_gt_rx_reset_0              ),
    .gtwiz_reset_tx_datapath        (gtwiz_reset_tx_datapath_0      ),
    .gtwiz_reset_rx_datapath        (gtwiz_reset_rx_datapath_0      ),
    .gt_txusrclk2                   (tx_clk_out_0                   ),
    .gt_rxusrclk2                   (rx_clk_out_0                   ),
    .rx_core_clk                    (rx_core_clk_0                  ),
    .gt_tx_reset_in                 (gtwiz_reset_tx_done_0          ),
    .gt_rx_reset_in                 (gtwiz_reset_rx_done_0          ),
    .tx_core_reset_in               (tx_reset_0                     ),
    .rx_core_reset_in               (rx_reset_0                     ),
    .tx_core_reset_out              (tx_core_reset_0                ),
    .rx_core_reset_out              (rx_core_reset_0                ),
    .rx_serdes_reset_out            (rx_serdes_reset_0              ),
    .usr_tx_reset                   (user_tx_reset_0                ),
    .usr_rx_reset                   (user_rx_reset_0                ),
    .gtwiz_reset_all                (gtwiz_reset_all_0              ),
    .gtwiz_reset_tx_datapath_out    (gtwiz_reset_tx_datapath_out_0  ),
    .gtwiz_reset_rx_datapath_out    (gtwiz_reset_rx_datapath_out_0  ),
    .sys_reset                      (sys_reset                      ),
    .dclk                           (dclk                           )
);

endmodule
