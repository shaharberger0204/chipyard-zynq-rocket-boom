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
    output                      pulse_out,
    
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
    inout           [7:1]       pmod_gpio_1_tri_io,
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

    .pulse_out                                  (pulse_out              ),

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


endmodule
