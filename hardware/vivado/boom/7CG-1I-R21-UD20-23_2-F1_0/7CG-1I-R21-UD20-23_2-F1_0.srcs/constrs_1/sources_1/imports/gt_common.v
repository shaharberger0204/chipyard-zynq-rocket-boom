`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: iWave Systems Technologies
// Engineer: N Hrishikesh Prabhu
// 
// Create Date: 27/09/2021
// Design Name: PRGBZ R1.5 2021.1 Draft Release
// Module Name: system
// Project Name: 19EG-1I-R15-ED30-21_1-F0_1
// Target Devices: XCZU19EG-FFVC1760-1-I
// Tool Versions: 2021.1
// Description: BSP FPGA Design for PRGBZ R1.5 SOM
//              Includes PS Peripherals, SDI, HDMI, PL DDR4, 10G Ethernet, 100G Ethernet, GPIOs
// 
// Dependencies: AR76649 UHD SDI Patch
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module gt_common(
    // SDI
    input   wire    qpll1reset_in,
    input   wire    gtrefclk_sdi,
    output  wire    qpll1lock_out,
    output  wire    qpll1outclk_out,
    output  wire    qpll1outrefclk_out,
    // 10G Ethernet
    input   wire    qpll0reset_in,
    input   wire    gtrefclk_10g,
    output  wire    qpll0lock_out,
    output  wire    qpll0outclk_out,
    output  wire    qpll0outrefclk_out
);

wire    [2:0]               qpll0refclksel;
wire    [2:0]               qpll1refclksel;
assign  qpll0refclksel  =   3'b001;
assign  qpll1refclksel  =   3'b001;

gtwizard_ultrascale_0_gthe4_common_wrapper gthe4_common_wrapper_inst (
    .GTHE4_COMMON_BGBYPASSB         (1'b1),
    .GTHE4_COMMON_BGMONITORENB      (1'b1),
    .GTHE4_COMMON_BGPDB             (1'b1),
    .GTHE4_COMMON_BGRCALOVRD        (5'b11111),
    .GTHE4_COMMON_BGRCALOVRDENB     (1'b1),
    .GTHE4_COMMON_DRPADDR           (16'b0000000000000000),
    .GTHE4_COMMON_DRPCLK            (1'b0),
    .GTHE4_COMMON_DRPDI             (16'b0000000000000000),
    .GTHE4_COMMON_DRPEN             (1'b0),
    .GTHE4_COMMON_DRPWE             (1'b0),
    .GTHE4_COMMON_GTGREFCLK0        (1'b0),
    .GTHE4_COMMON_GTGREFCLK1        (1'b0),
    .GTHE4_COMMON_GTNORTHREFCLK00   (1'b0),
    .GTHE4_COMMON_GTNORTHREFCLK01   (1'b0),
    .GTHE4_COMMON_GTNORTHREFCLK10   (1'b0),
    .GTHE4_COMMON_GTNORTHREFCLK11   (1'b0),
    .GTHE4_COMMON_GTREFCLK00        (gtrefclk_10g),         // 10G Refclk
    .GTHE4_COMMON_GTREFCLK01        (gtrefclk_sdi),         // SDI Refclk
    .GTHE4_COMMON_GTREFCLK10        (1'b0),             
    .GTHE4_COMMON_GTREFCLK11        (1'b0),
    .GTHE4_COMMON_GTSOUTHREFCLK00   (1'b0),
    .GTHE4_COMMON_GTSOUTHREFCLK01   (1'b0),
    .GTHE4_COMMON_GTSOUTHREFCLK10   (1'b0),
    .GTHE4_COMMON_GTSOUTHREFCLK11   (1'b0),
    .GTHE4_COMMON_PCIERATEQPLL0     (3'b000),
    .GTHE4_COMMON_PCIERATEQPLL1     (3'b000),
    .GTHE4_COMMON_PMARSVD0          (8'b00000000),
    .GTHE4_COMMON_PMARSVD1          (8'b00000000),
    .GTHE4_COMMON_QPLL0CLKRSVD0     (1'b0),
    .GTHE4_COMMON_QPLL0CLKRSVD1     (1'b0),
    .GTHE4_COMMON_QPLL0FBDIV        (8'b00000000),
    .GTHE4_COMMON_QPLL0LOCKDETCLK   (1'b0),
    .GTHE4_COMMON_QPLL0LOCKEN       (1'b1),
    .GTHE4_COMMON_QPLL0PD           (1'b0),
    .GTHE4_COMMON_QPLL0REFCLKSEL    (qpll0refclksel),   // 10G Refclk Select
    .GTHE4_COMMON_QPLL0RESET        (qpll0reset_in),    // 10G Reset
    .GTHE4_COMMON_QPLL1CLKRSVD0     (1'b0),
    .GTHE4_COMMON_QPLL1CLKRSVD1     (1'b0),
    .GTHE4_COMMON_QPLL1FBDIV        (8'b00000000),
    .GTHE4_COMMON_QPLL1LOCKDETCLK   (1'b0),
    .GTHE4_COMMON_QPLL1LOCKEN       (1'b1),
    .GTHE4_COMMON_QPLL1PD           (1'b0),
    .GTHE4_COMMON_QPLL1REFCLKSEL    (qpll1refclksel),   // SDI Refclk Select
    .GTHE4_COMMON_QPLL1RESET        (qpll1reset_in),    // SDI Reset
    .GTHE4_COMMON_QPLLRSVD1         (8'b00000000),
    .GTHE4_COMMON_QPLLRSVD2         (5'b00000),
    .GTHE4_COMMON_QPLLRSVD3         (5'b00000),
    .GTHE4_COMMON_QPLLRSVD4         (8'b00000000),
    .GTHE4_COMMON_RCALENB           (1'b1),
    .GTHE4_COMMON_SDM0DATA          (25'b0000000000000000000000000),
    .GTHE4_COMMON_SDM0RESET         (1'b0),
    .GTHE4_COMMON_SDM0TOGGLE        (1'b0),
    .GTHE4_COMMON_SDM0WIDTH         (2'b00),
    .GTHE4_COMMON_SDM1DATA          (25'b0000000000000000000000000),
    .GTHE4_COMMON_SDM1RESET         (1'b0),
    .GTHE4_COMMON_SDM1TOGGLE        (1'b0),
    .GTHE4_COMMON_SDM1WIDTH         (2'b00),
    .GTHE4_COMMON_TCONGPI           (10'b0000000000),
    .GTHE4_COMMON_TCONPOWERUP       (1'b0),
    .GTHE4_COMMON_TCONRESET         (2'b00),
    .GTHE4_COMMON_TCONRSVDIN1       (2'b00),
    .GTHE4_COMMON_DRPDO             (),
    .GTHE4_COMMON_DRPRDY            (),
    .GTHE4_COMMON_PMARSVDOUT0       (),
    .GTHE4_COMMON_PMARSVDOUT1       (),
    .GTHE4_COMMON_QPLL0FBCLKLOST    (),
    .GTHE4_COMMON_QPLL0LOCK         (qpll0lock_out),        // 10G QPLL0 LOCK
    .GTHE4_COMMON_QPLL0OUTCLK       (qpll0outclk_out),      // 10G QPLL0 OUT CLK
    .GTHE4_COMMON_QPLL0OUTREFCLK    (qpll0outrefclk_out),   // 10G QPLL0 OUT REFCLK
    .GTHE4_COMMON_QPLL0REFCLKLOST   (),
    .GTHE4_COMMON_QPLL1FBCLKLOST    (),
    .GTHE4_COMMON_QPLL1LOCK         (qpll1lock_out),        // SDI QPLL0 LOCK
    .GTHE4_COMMON_QPLL1OUTCLK       (qpll1outclk_out),      // SDI QPLL0 OUT CLK
    .GTHE4_COMMON_QPLL1OUTREFCLK    (qpll1outrefclk_out),   // SDI QPLL0 OUT REFCLK
    .GTHE4_COMMON_QPLL1REFCLKLOST   (),
    .GTHE4_COMMON_QPLLDMONITOR0     (),
    .GTHE4_COMMON_QPLLDMONITOR1     (),
    .GTHE4_COMMON_REFCLKOUTMONITOR0 (),
    .GTHE4_COMMON_REFCLKOUTMONITOR1 (),
    .GTHE4_COMMON_RXRECCLK0SEL      (),
    .GTHE4_COMMON_RXRECCLK1SEL      (),
    .GTHE4_COMMON_SDM0FINALOUT      (),
    .GTHE4_COMMON_SDM0TESTDATA      (),
    .GTHE4_COMMON_SDM1FINALOUT      (),
    .GTHE4_COMMON_SDM1TESTDATA      (),
    .GTHE4_COMMON_TCONGPO           (),
    .GTHE4_COMMON_TCONRSVDOUT0      ()
);

endmodule
