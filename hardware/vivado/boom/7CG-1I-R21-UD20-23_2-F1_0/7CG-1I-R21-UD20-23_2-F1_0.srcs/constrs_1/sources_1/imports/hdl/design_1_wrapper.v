//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Thu Jun  1 13:01:55 2023
//Host        : DESKTOP-H6AVOH1 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (board_config_gpio_tri_i,
    ctl_gt_reset_all_0,
    ctl_gt_rx_reset_0,
    ctl_gt_tx_reset_0,
    ddr4_act_n,
    ddr4_adr,
    ddr4_ba,
    ddr4_bg,
    ddr4_ck_c,
    ddr4_ck_t,
    ddr4_cke,
    ddr4_cs_n,
    ddr4_dm_n,
    ddr4_dq,
    ddr4_dqs_c,
    ddr4_dqs_t,
    ddr4_odt,
    ddr4_reset_n,
    ddr4_sysclk_clk_n,
    ddr4_sysclk_clk_p,
    dp_aux_n,
    dp_aux_p,
    dp_hpd,
    emio_gpio_i,
    emio_gpio_o,
    fmc1_gpio_1_tri_io,
    fmc1_gpio_2_tri_io,
    fmc1_gpio_3_tri_io,
    fmc2_gpio_1_tri_io,
    fmc2_gpio_2_tri_io,
    gem_3_mdio_mdc,
    gem_3_mdio_mdio_io,
    gt_loopback_out_0,
    gt_rx_serdes_interface_0_ch_rxdata,
    gt_rx_serdes_interface_0_ch_rxdatavalid,
    gt_rx_serdes_interface_0_ch_rxgearboxslip,
    gt_rx_serdes_interface_0_ch_rxheader,
    gt_rx_serdes_interface_0_ch_rxheadervalid,
    gt_tx_serdes_interface_0_ch_txdata,
    gt_tx_serdes_interface_0_ch_txheader,
    gtwiz_reset_rx_done_0,
    gtwiz_reset_tx_done_0,
    intf_0_qpll1lock_in,
    intf_0_qpll1out_clk_in,
    intf_0_qpll1out_refclk_in,
    intf_0_qpll1reset_out,
    peripheral_reset_125M,
    pl_resetn0,
    pmod_gpio_1_tri_io,
    pmod_gpio_2_tri_io,
    rx_clk_out_0,
    rx_reset,
    rx_reset_0,
    rx_serdes_clk_0,
    rx_serdes_reset_0,
    s_axi_aclk_0,
    sdi_rxn,
    sdi_rxp,
    sdi_txn,
    sdi_txp,
    tx_clk_out_0,
    tx_reset,
    tx_reset_0,
    user_rx_reset,
    user_tx_reset);
  input [1:0]board_config_gpio_tri_i;
  output ctl_gt_reset_all_0;
  output ctl_gt_rx_reset_0;
  output ctl_gt_tx_reset_0;
  output ddr4_act_n;
  output [16:0]ddr4_adr;
  output [1:0]ddr4_ba;
  output [0:0]ddr4_bg;
  output [0:0]ddr4_ck_c;
  output [0:0]ddr4_ck_t;
  output [0:0]ddr4_cke;
  output [0:0]ddr4_cs_n;
  inout [1:0]ddr4_dm_n;
  inout [15:0]ddr4_dq;
  inout [1:0]ddr4_dqs_c;
  inout [1:0]ddr4_dqs_t;
  output [0:0]ddr4_odt;
  output ddr4_reset_n;
  input ddr4_sysclk_clk_n;
  input ddr4_sysclk_clk_p;
  inout [0:0]dp_aux_n;
  inout [0:0]dp_aux_p;
  input dp_hpd;
  input [9:0]emio_gpio_i;
  output [9:0]emio_gpio_o;
  inout [31:0]fmc1_gpio_1_tri_io;
  inout [31:0]fmc1_gpio_2_tri_io;
  inout [7:0]fmc1_gpio_3_tri_io;
  inout [19:0]fmc2_gpio_1_tri_io;
  inout [19:0]fmc2_gpio_2_tri_io;
  output gem_3_mdio_mdc;
  inout gem_3_mdio_mdio_io;
  output gt_loopback_out_0;
  input [127:0]gt_rx_serdes_interface_0_ch_rxdata;
  input [1:0]gt_rx_serdes_interface_0_ch_rxdatavalid;
  output gt_rx_serdes_interface_0_ch_rxgearboxslip;
  input [5:0]gt_rx_serdes_interface_0_ch_rxheader;
  input [1:0]gt_rx_serdes_interface_0_ch_rxheadervalid;
  output [127:0]gt_tx_serdes_interface_0_ch_txdata;
  output [5:0]gt_tx_serdes_interface_0_ch_txheader;
  input gtwiz_reset_rx_done_0;
  input gtwiz_reset_tx_done_0;
  input intf_0_qpll1lock_in;
  input intf_0_qpll1out_clk_in;
  input intf_0_qpll1out_refclk_in;
  output intf_0_qpll1reset_out;
  output [0:0]peripheral_reset_125M;
  output pl_resetn0;
  inout [7:0]pmod_gpio_1_tri_io;
  inout [7:0]pmod_gpio_2_tri_io;
  input rx_clk_out_0;
  output [0:0]rx_reset;
  input rx_reset_0;
  input rx_serdes_clk_0;
  input rx_serdes_reset_0;
  output s_axi_aclk_0;
  input sdi_rxn;
  input sdi_rxp;
  output sdi_txn;
  output sdi_txp;
  input tx_clk_out_0;
  output [0:0]tx_reset;
  input tx_reset_0;
  input user_rx_reset;
  input user_tx_reset;

  wire [1:0]board_config_gpio_tri_i;
  wire ctl_gt_reset_all_0;
  wire ctl_gt_rx_reset_0;
  wire ctl_gt_tx_reset_0;
  wire ddr4_act_n;
  wire [16:0]ddr4_adr;
  wire [1:0]ddr4_ba;
  wire [0:0]ddr4_bg;
  wire [0:0]ddr4_ck_c;
  wire [0:0]ddr4_ck_t;
  wire [0:0]ddr4_cke;
  wire [0:0]ddr4_cs_n;
  wire [1:0]ddr4_dm_n;
  wire [15:0]ddr4_dq;
  wire [1:0]ddr4_dqs_c;
  wire [1:0]ddr4_dqs_t;
  wire [0:0]ddr4_odt;
  wire ddr4_reset_n;
  wire ddr4_sysclk_clk_n;
  wire ddr4_sysclk_clk_p;
  wire [0:0]dp_aux_n;
  wire [0:0]dp_aux_p;
  wire dp_hpd;
  wire [9:0]emio_gpio_i;
  wire [9:0]emio_gpio_o;
  wire [0:0]fmc1_gpio_1_tri_i_0;
  wire [1:1]fmc1_gpio_1_tri_i_1;
  wire [10:10]fmc1_gpio_1_tri_i_10;
  wire [11:11]fmc1_gpio_1_tri_i_11;
  wire [12:12]fmc1_gpio_1_tri_i_12;
  wire [13:13]fmc1_gpio_1_tri_i_13;
  wire [14:14]fmc1_gpio_1_tri_i_14;
  wire [15:15]fmc1_gpio_1_tri_i_15;
  wire [16:16]fmc1_gpio_1_tri_i_16;
  wire [17:17]fmc1_gpio_1_tri_i_17;
  wire [18:18]fmc1_gpio_1_tri_i_18;
  wire [19:19]fmc1_gpio_1_tri_i_19;
  wire [2:2]fmc1_gpio_1_tri_i_2;
  wire [20:20]fmc1_gpio_1_tri_i_20;
  wire [21:21]fmc1_gpio_1_tri_i_21;
  wire [22:22]fmc1_gpio_1_tri_i_22;
  wire [23:23]fmc1_gpio_1_tri_i_23;
  wire [24:24]fmc1_gpio_1_tri_i_24;
  wire [25:25]fmc1_gpio_1_tri_i_25;
  wire [26:26]fmc1_gpio_1_tri_i_26;
  wire [27:27]fmc1_gpio_1_tri_i_27;
  wire [28:28]fmc1_gpio_1_tri_i_28;
  wire [29:29]fmc1_gpio_1_tri_i_29;
  wire [3:3]fmc1_gpio_1_tri_i_3;
  wire [30:30]fmc1_gpio_1_tri_i_30;
  wire [31:31]fmc1_gpio_1_tri_i_31;
  wire [4:4]fmc1_gpio_1_tri_i_4;
  wire [5:5]fmc1_gpio_1_tri_i_5;
  wire [6:6]fmc1_gpio_1_tri_i_6;
  wire [7:7]fmc1_gpio_1_tri_i_7;
  wire [8:8]fmc1_gpio_1_tri_i_8;
  wire [9:9]fmc1_gpio_1_tri_i_9;
  wire [0:0]fmc1_gpio_1_tri_io_0;
  wire [1:1]fmc1_gpio_1_tri_io_1;
  wire [10:10]fmc1_gpio_1_tri_io_10;
  wire [11:11]fmc1_gpio_1_tri_io_11;
  wire [12:12]fmc1_gpio_1_tri_io_12;
  wire [13:13]fmc1_gpio_1_tri_io_13;
  wire [14:14]fmc1_gpio_1_tri_io_14;
  wire [15:15]fmc1_gpio_1_tri_io_15;
  wire [16:16]fmc1_gpio_1_tri_io_16;
  wire [17:17]fmc1_gpio_1_tri_io_17;
  wire [18:18]fmc1_gpio_1_tri_io_18;
  wire [19:19]fmc1_gpio_1_tri_io_19;
  wire [2:2]fmc1_gpio_1_tri_io_2;
  wire [20:20]fmc1_gpio_1_tri_io_20;
  wire [21:21]fmc1_gpio_1_tri_io_21;
  wire [22:22]fmc1_gpio_1_tri_io_22;
  wire [23:23]fmc1_gpio_1_tri_io_23;
  wire [24:24]fmc1_gpio_1_tri_io_24;
  wire [25:25]fmc1_gpio_1_tri_io_25;
  wire [26:26]fmc1_gpio_1_tri_io_26;
  wire [27:27]fmc1_gpio_1_tri_io_27;
  wire [28:28]fmc1_gpio_1_tri_io_28;
  wire [29:29]fmc1_gpio_1_tri_io_29;
  wire [3:3]fmc1_gpio_1_tri_io_3;
  wire [30:30]fmc1_gpio_1_tri_io_30;
  wire [31:31]fmc1_gpio_1_tri_io_31;
  wire [4:4]fmc1_gpio_1_tri_io_4;
  wire [5:5]fmc1_gpio_1_tri_io_5;
  wire [6:6]fmc1_gpio_1_tri_io_6;
  wire [7:7]fmc1_gpio_1_tri_io_7;
  wire [8:8]fmc1_gpio_1_tri_io_8;
  wire [9:9]fmc1_gpio_1_tri_io_9;
  wire [0:0]fmc1_gpio_1_tri_o_0;
  wire [1:1]fmc1_gpio_1_tri_o_1;
  wire [10:10]fmc1_gpio_1_tri_o_10;
  wire [11:11]fmc1_gpio_1_tri_o_11;
  wire [12:12]fmc1_gpio_1_tri_o_12;
  wire [13:13]fmc1_gpio_1_tri_o_13;
  wire [14:14]fmc1_gpio_1_tri_o_14;
  wire [15:15]fmc1_gpio_1_tri_o_15;
  wire [16:16]fmc1_gpio_1_tri_o_16;
  wire [17:17]fmc1_gpio_1_tri_o_17;
  wire [18:18]fmc1_gpio_1_tri_o_18;
  wire [19:19]fmc1_gpio_1_tri_o_19;
  wire [2:2]fmc1_gpio_1_tri_o_2;
  wire [20:20]fmc1_gpio_1_tri_o_20;
  wire [21:21]fmc1_gpio_1_tri_o_21;
  wire [22:22]fmc1_gpio_1_tri_o_22;
  wire [23:23]fmc1_gpio_1_tri_o_23;
  wire [24:24]fmc1_gpio_1_tri_o_24;
  wire [25:25]fmc1_gpio_1_tri_o_25;
  wire [26:26]fmc1_gpio_1_tri_o_26;
  wire [27:27]fmc1_gpio_1_tri_o_27;
  wire [28:28]fmc1_gpio_1_tri_o_28;
  wire [29:29]fmc1_gpio_1_tri_o_29;
  wire [3:3]fmc1_gpio_1_tri_o_3;
  wire [30:30]fmc1_gpio_1_tri_o_30;
  wire [31:31]fmc1_gpio_1_tri_o_31;
  wire [4:4]fmc1_gpio_1_tri_o_4;
  wire [5:5]fmc1_gpio_1_tri_o_5;
  wire [6:6]fmc1_gpio_1_tri_o_6;
  wire [7:7]fmc1_gpio_1_tri_o_7;
  wire [8:8]fmc1_gpio_1_tri_o_8;
  wire [9:9]fmc1_gpio_1_tri_o_9;
  wire [0:0]fmc1_gpio_1_tri_t_0;
  wire [1:1]fmc1_gpio_1_tri_t_1;
  wire [10:10]fmc1_gpio_1_tri_t_10;
  wire [11:11]fmc1_gpio_1_tri_t_11;
  wire [12:12]fmc1_gpio_1_tri_t_12;
  wire [13:13]fmc1_gpio_1_tri_t_13;
  wire [14:14]fmc1_gpio_1_tri_t_14;
  wire [15:15]fmc1_gpio_1_tri_t_15;
  wire [16:16]fmc1_gpio_1_tri_t_16;
  wire [17:17]fmc1_gpio_1_tri_t_17;
  wire [18:18]fmc1_gpio_1_tri_t_18;
  wire [19:19]fmc1_gpio_1_tri_t_19;
  wire [2:2]fmc1_gpio_1_tri_t_2;
  wire [20:20]fmc1_gpio_1_tri_t_20;
  wire [21:21]fmc1_gpio_1_tri_t_21;
  wire [22:22]fmc1_gpio_1_tri_t_22;
  wire [23:23]fmc1_gpio_1_tri_t_23;
  wire [24:24]fmc1_gpio_1_tri_t_24;
  wire [25:25]fmc1_gpio_1_tri_t_25;
  wire [26:26]fmc1_gpio_1_tri_t_26;
  wire [27:27]fmc1_gpio_1_tri_t_27;
  wire [28:28]fmc1_gpio_1_tri_t_28;
  wire [29:29]fmc1_gpio_1_tri_t_29;
  wire [3:3]fmc1_gpio_1_tri_t_3;
  wire [30:30]fmc1_gpio_1_tri_t_30;
  wire [31:31]fmc1_gpio_1_tri_t_31;
  wire [4:4]fmc1_gpio_1_tri_t_4;
  wire [5:5]fmc1_gpio_1_tri_t_5;
  wire [6:6]fmc1_gpio_1_tri_t_6;
  wire [7:7]fmc1_gpio_1_tri_t_7;
  wire [8:8]fmc1_gpio_1_tri_t_8;
  wire [9:9]fmc1_gpio_1_tri_t_9;
  wire [0:0]fmc1_gpio_2_tri_i_0;
  wire [1:1]fmc1_gpio_2_tri_i_1;
  wire [10:10]fmc1_gpio_2_tri_i_10;
  wire [11:11]fmc1_gpio_2_tri_i_11;
  wire [12:12]fmc1_gpio_2_tri_i_12;
  wire [13:13]fmc1_gpio_2_tri_i_13;
  wire [14:14]fmc1_gpio_2_tri_i_14;
  wire [15:15]fmc1_gpio_2_tri_i_15;
  wire [16:16]fmc1_gpio_2_tri_i_16;
  wire [17:17]fmc1_gpio_2_tri_i_17;
  wire [18:18]fmc1_gpio_2_tri_i_18;
  wire [19:19]fmc1_gpio_2_tri_i_19;
  wire [2:2]fmc1_gpio_2_tri_i_2;
  wire [20:20]fmc1_gpio_2_tri_i_20;
  wire [21:21]fmc1_gpio_2_tri_i_21;
  wire [22:22]fmc1_gpio_2_tri_i_22;
  wire [23:23]fmc1_gpio_2_tri_i_23;
  wire [24:24]fmc1_gpio_2_tri_i_24;
  wire [25:25]fmc1_gpio_2_tri_i_25;
  wire [26:26]fmc1_gpio_2_tri_i_26;
  wire [27:27]fmc1_gpio_2_tri_i_27;
  wire [28:28]fmc1_gpio_2_tri_i_28;
  wire [29:29]fmc1_gpio_2_tri_i_29;
  wire [3:3]fmc1_gpio_2_tri_i_3;
  wire [30:30]fmc1_gpio_2_tri_i_30;
  wire [31:31]fmc1_gpio_2_tri_i_31;
  wire [4:4]fmc1_gpio_2_tri_i_4;
  wire [5:5]fmc1_gpio_2_tri_i_5;
  wire [6:6]fmc1_gpio_2_tri_i_6;
  wire [7:7]fmc1_gpio_2_tri_i_7;
  wire [8:8]fmc1_gpio_2_tri_i_8;
  wire [9:9]fmc1_gpio_2_tri_i_9;
  wire [0:0]fmc1_gpio_2_tri_io_0;
  wire [1:1]fmc1_gpio_2_tri_io_1;
  wire [10:10]fmc1_gpio_2_tri_io_10;
  wire [11:11]fmc1_gpio_2_tri_io_11;
  wire [12:12]fmc1_gpio_2_tri_io_12;
  wire [13:13]fmc1_gpio_2_tri_io_13;
  wire [14:14]fmc1_gpio_2_tri_io_14;
  wire [15:15]fmc1_gpio_2_tri_io_15;
  wire [16:16]fmc1_gpio_2_tri_io_16;
  wire [17:17]fmc1_gpio_2_tri_io_17;
  wire [18:18]fmc1_gpio_2_tri_io_18;
  wire [19:19]fmc1_gpio_2_tri_io_19;
  wire [2:2]fmc1_gpio_2_tri_io_2;
  wire [20:20]fmc1_gpio_2_tri_io_20;
  wire [21:21]fmc1_gpio_2_tri_io_21;
  wire [22:22]fmc1_gpio_2_tri_io_22;
  wire [23:23]fmc1_gpio_2_tri_io_23;
  wire [24:24]fmc1_gpio_2_tri_io_24;
  wire [25:25]fmc1_gpio_2_tri_io_25;
  wire [26:26]fmc1_gpio_2_tri_io_26;
  wire [27:27]fmc1_gpio_2_tri_io_27;
  wire [28:28]fmc1_gpio_2_tri_io_28;
  wire [29:29]fmc1_gpio_2_tri_io_29;
  wire [3:3]fmc1_gpio_2_tri_io_3;
  wire [30:30]fmc1_gpio_2_tri_io_30;
  wire [31:31]fmc1_gpio_2_tri_io_31;
  wire [4:4]fmc1_gpio_2_tri_io_4;
  wire [5:5]fmc1_gpio_2_tri_io_5;
  wire [6:6]fmc1_gpio_2_tri_io_6;
  wire [7:7]fmc1_gpio_2_tri_io_7;
  wire [8:8]fmc1_gpio_2_tri_io_8;
  wire [9:9]fmc1_gpio_2_tri_io_9;
  wire [0:0]fmc1_gpio_2_tri_o_0;
  wire [1:1]fmc1_gpio_2_tri_o_1;
  wire [10:10]fmc1_gpio_2_tri_o_10;
  wire [11:11]fmc1_gpio_2_tri_o_11;
  wire [12:12]fmc1_gpio_2_tri_o_12;
  wire [13:13]fmc1_gpio_2_tri_o_13;
  wire [14:14]fmc1_gpio_2_tri_o_14;
  wire [15:15]fmc1_gpio_2_tri_o_15;
  wire [16:16]fmc1_gpio_2_tri_o_16;
  wire [17:17]fmc1_gpio_2_tri_o_17;
  wire [18:18]fmc1_gpio_2_tri_o_18;
  wire [19:19]fmc1_gpio_2_tri_o_19;
  wire [2:2]fmc1_gpio_2_tri_o_2;
  wire [20:20]fmc1_gpio_2_tri_o_20;
  wire [21:21]fmc1_gpio_2_tri_o_21;
  wire [22:22]fmc1_gpio_2_tri_o_22;
  wire [23:23]fmc1_gpio_2_tri_o_23;
  wire [24:24]fmc1_gpio_2_tri_o_24;
  wire [25:25]fmc1_gpio_2_tri_o_25;
  wire [26:26]fmc1_gpio_2_tri_o_26;
  wire [27:27]fmc1_gpio_2_tri_o_27;
  wire [28:28]fmc1_gpio_2_tri_o_28;
  wire [29:29]fmc1_gpio_2_tri_o_29;
  wire [3:3]fmc1_gpio_2_tri_o_3;
  wire [30:30]fmc1_gpio_2_tri_o_30;
  wire [31:31]fmc1_gpio_2_tri_o_31;
  wire [4:4]fmc1_gpio_2_tri_o_4;
  wire [5:5]fmc1_gpio_2_tri_o_5;
  wire [6:6]fmc1_gpio_2_tri_o_6;
  wire [7:7]fmc1_gpio_2_tri_o_7;
  wire [8:8]fmc1_gpio_2_tri_o_8;
  wire [9:9]fmc1_gpio_2_tri_o_9;
  wire [0:0]fmc1_gpio_2_tri_t_0;
  wire [1:1]fmc1_gpio_2_tri_t_1;
  wire [10:10]fmc1_gpio_2_tri_t_10;
  wire [11:11]fmc1_gpio_2_tri_t_11;
  wire [12:12]fmc1_gpio_2_tri_t_12;
  wire [13:13]fmc1_gpio_2_tri_t_13;
  wire [14:14]fmc1_gpio_2_tri_t_14;
  wire [15:15]fmc1_gpio_2_tri_t_15;
  wire [16:16]fmc1_gpio_2_tri_t_16;
  wire [17:17]fmc1_gpio_2_tri_t_17;
  wire [18:18]fmc1_gpio_2_tri_t_18;
  wire [19:19]fmc1_gpio_2_tri_t_19;
  wire [2:2]fmc1_gpio_2_tri_t_2;
  wire [20:20]fmc1_gpio_2_tri_t_20;
  wire [21:21]fmc1_gpio_2_tri_t_21;
  wire [22:22]fmc1_gpio_2_tri_t_22;
  wire [23:23]fmc1_gpio_2_tri_t_23;
  wire [24:24]fmc1_gpio_2_tri_t_24;
  wire [25:25]fmc1_gpio_2_tri_t_25;
  wire [26:26]fmc1_gpio_2_tri_t_26;
  wire [27:27]fmc1_gpio_2_tri_t_27;
  wire [28:28]fmc1_gpio_2_tri_t_28;
  wire [29:29]fmc1_gpio_2_tri_t_29;
  wire [3:3]fmc1_gpio_2_tri_t_3;
  wire [30:30]fmc1_gpio_2_tri_t_30;
  wire [31:31]fmc1_gpio_2_tri_t_31;
  wire [4:4]fmc1_gpio_2_tri_t_4;
  wire [5:5]fmc1_gpio_2_tri_t_5;
  wire [6:6]fmc1_gpio_2_tri_t_6;
  wire [7:7]fmc1_gpio_2_tri_t_7;
  wire [8:8]fmc1_gpio_2_tri_t_8;
  wire [9:9]fmc1_gpio_2_tri_t_9;
  wire [0:0]fmc1_gpio_3_tri_i_0;
  wire [1:1]fmc1_gpio_3_tri_i_1;
  wire [2:2]fmc1_gpio_3_tri_i_2;
  wire [3:3]fmc1_gpio_3_tri_i_3;
  wire [4:4]fmc1_gpio_3_tri_i_4;
  wire [5:5]fmc1_gpio_3_tri_i_5;
  wire [6:6]fmc1_gpio_3_tri_i_6;
  wire [7:7]fmc1_gpio_3_tri_i_7;
  wire [0:0]fmc1_gpio_3_tri_io_0;
  wire [1:1]fmc1_gpio_3_tri_io_1;
  wire [2:2]fmc1_gpio_3_tri_io_2;
  wire [3:3]fmc1_gpio_3_tri_io_3;
  wire [4:4]fmc1_gpio_3_tri_io_4;
  wire [5:5]fmc1_gpio_3_tri_io_5;
  wire [6:6]fmc1_gpio_3_tri_io_6;
  wire [7:7]fmc1_gpio_3_tri_io_7;
  wire [0:0]fmc1_gpio_3_tri_o_0;
  wire [1:1]fmc1_gpio_3_tri_o_1;
  wire [2:2]fmc1_gpio_3_tri_o_2;
  wire [3:3]fmc1_gpio_3_tri_o_3;
  wire [4:4]fmc1_gpio_3_tri_o_4;
  wire [5:5]fmc1_gpio_3_tri_o_5;
  wire [6:6]fmc1_gpio_3_tri_o_6;
  wire [7:7]fmc1_gpio_3_tri_o_7;
  wire [0:0]fmc1_gpio_3_tri_t_0;
  wire [1:1]fmc1_gpio_3_tri_t_1;
  wire [2:2]fmc1_gpio_3_tri_t_2;
  wire [3:3]fmc1_gpio_3_tri_t_3;
  wire [4:4]fmc1_gpio_3_tri_t_4;
  wire [5:5]fmc1_gpio_3_tri_t_5;
  wire [6:6]fmc1_gpio_3_tri_t_6;
  wire [7:7]fmc1_gpio_3_tri_t_7;
  wire [0:0]fmc2_gpio_1_tri_i_0;
  wire [1:1]fmc2_gpio_1_tri_i_1;
  wire [10:10]fmc2_gpio_1_tri_i_10;
  wire [11:11]fmc2_gpio_1_tri_i_11;
  wire [12:12]fmc2_gpio_1_tri_i_12;
  wire [13:13]fmc2_gpio_1_tri_i_13;
  wire [14:14]fmc2_gpio_1_tri_i_14;
  wire [15:15]fmc2_gpio_1_tri_i_15;
  wire [16:16]fmc2_gpio_1_tri_i_16;
  wire [17:17]fmc2_gpio_1_tri_i_17;
  wire [18:18]fmc2_gpio_1_tri_i_18;
  wire [19:19]fmc2_gpio_1_tri_i_19;
  wire [2:2]fmc2_gpio_1_tri_i_2;
  wire [3:3]fmc2_gpio_1_tri_i_3;
  wire [4:4]fmc2_gpio_1_tri_i_4;
  wire [5:5]fmc2_gpio_1_tri_i_5;
  wire [6:6]fmc2_gpio_1_tri_i_6;
  wire [7:7]fmc2_gpio_1_tri_i_7;
  wire [8:8]fmc2_gpio_1_tri_i_8;
  wire [9:9]fmc2_gpio_1_tri_i_9;
  wire [0:0]fmc2_gpio_1_tri_io_0;
  wire [1:1]fmc2_gpio_1_tri_io_1;
  wire [10:10]fmc2_gpio_1_tri_io_10;
  wire [11:11]fmc2_gpio_1_tri_io_11;
  wire [12:12]fmc2_gpio_1_tri_io_12;
  wire [13:13]fmc2_gpio_1_tri_io_13;
  wire [14:14]fmc2_gpio_1_tri_io_14;
  wire [15:15]fmc2_gpio_1_tri_io_15;
  wire [16:16]fmc2_gpio_1_tri_io_16;
  wire [17:17]fmc2_gpio_1_tri_io_17;
  wire [18:18]fmc2_gpio_1_tri_io_18;
  wire [19:19]fmc2_gpio_1_tri_io_19;
  wire [2:2]fmc2_gpio_1_tri_io_2;
  wire [3:3]fmc2_gpio_1_tri_io_3;
  wire [4:4]fmc2_gpio_1_tri_io_4;
  wire [5:5]fmc2_gpio_1_tri_io_5;
  wire [6:6]fmc2_gpio_1_tri_io_6;
  wire [7:7]fmc2_gpio_1_tri_io_7;
  wire [8:8]fmc2_gpio_1_tri_io_8;
  wire [9:9]fmc2_gpio_1_tri_io_9;
  wire [0:0]fmc2_gpio_1_tri_o_0;
  wire [1:1]fmc2_gpio_1_tri_o_1;
  wire [10:10]fmc2_gpio_1_tri_o_10;
  wire [11:11]fmc2_gpio_1_tri_o_11;
  wire [12:12]fmc2_gpio_1_tri_o_12;
  wire [13:13]fmc2_gpio_1_tri_o_13;
  wire [14:14]fmc2_gpio_1_tri_o_14;
  wire [15:15]fmc2_gpio_1_tri_o_15;
  wire [16:16]fmc2_gpio_1_tri_o_16;
  wire [17:17]fmc2_gpio_1_tri_o_17;
  wire [18:18]fmc2_gpio_1_tri_o_18;
  wire [19:19]fmc2_gpio_1_tri_o_19;
  wire [2:2]fmc2_gpio_1_tri_o_2;
  wire [3:3]fmc2_gpio_1_tri_o_3;
  wire [4:4]fmc2_gpio_1_tri_o_4;
  wire [5:5]fmc2_gpio_1_tri_o_5;
  wire [6:6]fmc2_gpio_1_tri_o_6;
  wire [7:7]fmc2_gpio_1_tri_o_7;
  wire [8:8]fmc2_gpio_1_tri_o_8;
  wire [9:9]fmc2_gpio_1_tri_o_9;
  wire [0:0]fmc2_gpio_1_tri_t_0;
  wire [1:1]fmc2_gpio_1_tri_t_1;
  wire [10:10]fmc2_gpio_1_tri_t_10;
  wire [11:11]fmc2_gpio_1_tri_t_11;
  wire [12:12]fmc2_gpio_1_tri_t_12;
  wire [13:13]fmc2_gpio_1_tri_t_13;
  wire [14:14]fmc2_gpio_1_tri_t_14;
  wire [15:15]fmc2_gpio_1_tri_t_15;
  wire [16:16]fmc2_gpio_1_tri_t_16;
  wire [17:17]fmc2_gpio_1_tri_t_17;
  wire [18:18]fmc2_gpio_1_tri_t_18;
  wire [19:19]fmc2_gpio_1_tri_t_19;
  wire [2:2]fmc2_gpio_1_tri_t_2;
  wire [3:3]fmc2_gpio_1_tri_t_3;
  wire [4:4]fmc2_gpio_1_tri_t_4;
  wire [5:5]fmc2_gpio_1_tri_t_5;
  wire [6:6]fmc2_gpio_1_tri_t_6;
  wire [7:7]fmc2_gpio_1_tri_t_7;
  wire [8:8]fmc2_gpio_1_tri_t_8;
  wire [9:9]fmc2_gpio_1_tri_t_9;
  wire [0:0]fmc2_gpio_2_tri_i_0;
  wire [1:1]fmc2_gpio_2_tri_i_1;
  wire [10:10]fmc2_gpio_2_tri_i_10;
  wire [11:11]fmc2_gpio_2_tri_i_11;
  wire [12:12]fmc2_gpio_2_tri_i_12;
  wire [13:13]fmc2_gpio_2_tri_i_13;
  wire [14:14]fmc2_gpio_2_tri_i_14;
  wire [15:15]fmc2_gpio_2_tri_i_15;
  wire [16:16]fmc2_gpio_2_tri_i_16;
  wire [17:17]fmc2_gpio_2_tri_i_17;
  wire [18:18]fmc2_gpio_2_tri_i_18;
  wire [19:19]fmc2_gpio_2_tri_i_19;
  wire [2:2]fmc2_gpio_2_tri_i_2;
  wire [3:3]fmc2_gpio_2_tri_i_3;
  wire [4:4]fmc2_gpio_2_tri_i_4;
  wire [5:5]fmc2_gpio_2_tri_i_5;
  wire [6:6]fmc2_gpio_2_tri_i_6;
  wire [7:7]fmc2_gpio_2_tri_i_7;
  wire [8:8]fmc2_gpio_2_tri_i_8;
  wire [9:9]fmc2_gpio_2_tri_i_9;
  wire [0:0]fmc2_gpio_2_tri_io_0;
  wire [1:1]fmc2_gpio_2_tri_io_1;
  wire [10:10]fmc2_gpio_2_tri_io_10;
  wire [11:11]fmc2_gpio_2_tri_io_11;
  wire [12:12]fmc2_gpio_2_tri_io_12;
  wire [13:13]fmc2_gpio_2_tri_io_13;
  wire [14:14]fmc2_gpio_2_tri_io_14;
  wire [15:15]fmc2_gpio_2_tri_io_15;
  wire [16:16]fmc2_gpio_2_tri_io_16;
  wire [17:17]fmc2_gpio_2_tri_io_17;
  wire [18:18]fmc2_gpio_2_tri_io_18;
  wire [19:19]fmc2_gpio_2_tri_io_19;
  wire [2:2]fmc2_gpio_2_tri_io_2;
  wire [3:3]fmc2_gpio_2_tri_io_3;
  wire [4:4]fmc2_gpio_2_tri_io_4;
  wire [5:5]fmc2_gpio_2_tri_io_5;
  wire [6:6]fmc2_gpio_2_tri_io_6;
  wire [7:7]fmc2_gpio_2_tri_io_7;
  wire [8:8]fmc2_gpio_2_tri_io_8;
  wire [9:9]fmc2_gpio_2_tri_io_9;
  wire [0:0]fmc2_gpio_2_tri_o_0;
  wire [1:1]fmc2_gpio_2_tri_o_1;
  wire [10:10]fmc2_gpio_2_tri_o_10;
  wire [11:11]fmc2_gpio_2_tri_o_11;
  wire [12:12]fmc2_gpio_2_tri_o_12;
  wire [13:13]fmc2_gpio_2_tri_o_13;
  wire [14:14]fmc2_gpio_2_tri_o_14;
  wire [15:15]fmc2_gpio_2_tri_o_15;
  wire [16:16]fmc2_gpio_2_tri_o_16;
  wire [17:17]fmc2_gpio_2_tri_o_17;
  wire [18:18]fmc2_gpio_2_tri_o_18;
  wire [19:19]fmc2_gpio_2_tri_o_19;
  wire [2:2]fmc2_gpio_2_tri_o_2;
  wire [3:3]fmc2_gpio_2_tri_o_3;
  wire [4:4]fmc2_gpio_2_tri_o_4;
  wire [5:5]fmc2_gpio_2_tri_o_5;
  wire [6:6]fmc2_gpio_2_tri_o_6;
  wire [7:7]fmc2_gpio_2_tri_o_7;
  wire [8:8]fmc2_gpio_2_tri_o_8;
  wire [9:9]fmc2_gpio_2_tri_o_9;
  wire [0:0]fmc2_gpio_2_tri_t_0;
  wire [1:1]fmc2_gpio_2_tri_t_1;
  wire [10:10]fmc2_gpio_2_tri_t_10;
  wire [11:11]fmc2_gpio_2_tri_t_11;
  wire [12:12]fmc2_gpio_2_tri_t_12;
  wire [13:13]fmc2_gpio_2_tri_t_13;
  wire [14:14]fmc2_gpio_2_tri_t_14;
  wire [15:15]fmc2_gpio_2_tri_t_15;
  wire [16:16]fmc2_gpio_2_tri_t_16;
  wire [17:17]fmc2_gpio_2_tri_t_17;
  wire [18:18]fmc2_gpio_2_tri_t_18;
  wire [19:19]fmc2_gpio_2_tri_t_19;
  wire [2:2]fmc2_gpio_2_tri_t_2;
  wire [3:3]fmc2_gpio_2_tri_t_3;
  wire [4:4]fmc2_gpio_2_tri_t_4;
  wire [5:5]fmc2_gpio_2_tri_t_5;
  wire [6:6]fmc2_gpio_2_tri_t_6;
  wire [7:7]fmc2_gpio_2_tri_t_7;
  wire [8:8]fmc2_gpio_2_tri_t_8;
  wire [9:9]fmc2_gpio_2_tri_t_9;
  wire gem_3_mdio_mdc;
  wire gem_3_mdio_mdio_i;
  wire gem_3_mdio_mdio_io;
  wire gem_3_mdio_mdio_o;
  wire gem_3_mdio_mdio_t;
  wire gt_loopback_out_0;
  wire [127:0]gt_rx_serdes_interface_0_ch_rxdata;
  wire [1:0]gt_rx_serdes_interface_0_ch_rxdatavalid;
  wire gt_rx_serdes_interface_0_ch_rxgearboxslip;
  wire [5:0]gt_rx_serdes_interface_0_ch_rxheader;
  wire [1:0]gt_rx_serdes_interface_0_ch_rxheadervalid;
  wire [127:0]gt_tx_serdes_interface_0_ch_txdata;
  wire [5:0]gt_tx_serdes_interface_0_ch_txheader;
  wire gtwiz_reset_rx_done_0;
  wire gtwiz_reset_tx_done_0;
  wire intf_0_qpll1lock_in;
  wire intf_0_qpll1out_clk_in;
  wire intf_0_qpll1out_refclk_in;
  wire intf_0_qpll1reset_out;
  wire [0:0]peripheral_reset_125M;
  wire pl_resetn0;
  wire [0:0]pmod_gpio_1_tri_i_0;
  wire [1:1]pmod_gpio_1_tri_i_1;
  wire [2:2]pmod_gpio_1_tri_i_2;
  wire [3:3]pmod_gpio_1_tri_i_3;
  wire [4:4]pmod_gpio_1_tri_i_4;
  wire [5:5]pmod_gpio_1_tri_i_5;
  wire [6:6]pmod_gpio_1_tri_i_6;
  wire [7:7]pmod_gpio_1_tri_i_7;
  wire [0:0]pmod_gpio_1_tri_io_0;
  wire [1:1]pmod_gpio_1_tri_io_1;
  wire [2:2]pmod_gpio_1_tri_io_2;
  wire [3:3]pmod_gpio_1_tri_io_3;
  wire [4:4]pmod_gpio_1_tri_io_4;
  wire [5:5]pmod_gpio_1_tri_io_5;
  wire [6:6]pmod_gpio_1_tri_io_6;
  wire [7:7]pmod_gpio_1_tri_io_7;
  wire [0:0]pmod_gpio_1_tri_o_0;
  wire [1:1]pmod_gpio_1_tri_o_1;
  wire [2:2]pmod_gpio_1_tri_o_2;
  wire [3:3]pmod_gpio_1_tri_o_3;
  wire [4:4]pmod_gpio_1_tri_o_4;
  wire [5:5]pmod_gpio_1_tri_o_5;
  wire [6:6]pmod_gpio_1_tri_o_6;
  wire [7:7]pmod_gpio_1_tri_o_7;
  wire [0:0]pmod_gpio_1_tri_t_0;
  wire [1:1]pmod_gpio_1_tri_t_1;
  wire [2:2]pmod_gpio_1_tri_t_2;
  wire [3:3]pmod_gpio_1_tri_t_3;
  wire [4:4]pmod_gpio_1_tri_t_4;
  wire [5:5]pmod_gpio_1_tri_t_5;
  wire [6:6]pmod_gpio_1_tri_t_6;
  wire [7:7]pmod_gpio_1_tri_t_7;
  wire [0:0]pmod_gpio_2_tri_i_0;
  wire [1:1]pmod_gpio_2_tri_i_1;
  wire [2:2]pmod_gpio_2_tri_i_2;
  wire [3:3]pmod_gpio_2_tri_i_3;
  wire [4:4]pmod_gpio_2_tri_i_4;
  wire [5:5]pmod_gpio_2_tri_i_5;
  wire [6:6]pmod_gpio_2_tri_i_6;
  wire [7:7]pmod_gpio_2_tri_i_7;
  wire [0:0]pmod_gpio_2_tri_io_0;
  wire [1:1]pmod_gpio_2_tri_io_1;
  wire [2:2]pmod_gpio_2_tri_io_2;
  wire [3:3]pmod_gpio_2_tri_io_3;
  wire [4:4]pmod_gpio_2_tri_io_4;
  wire [5:5]pmod_gpio_2_tri_io_5;
  wire [6:6]pmod_gpio_2_tri_io_6;
  wire [7:7]pmod_gpio_2_tri_io_7;
  wire [0:0]pmod_gpio_2_tri_o_0;
  wire [1:1]pmod_gpio_2_tri_o_1;
  wire [2:2]pmod_gpio_2_tri_o_2;
  wire [3:3]pmod_gpio_2_tri_o_3;
  wire [4:4]pmod_gpio_2_tri_o_4;
  wire [5:5]pmod_gpio_2_tri_o_5;
  wire [6:6]pmod_gpio_2_tri_o_6;
  wire [7:7]pmod_gpio_2_tri_o_7;
  wire [0:0]pmod_gpio_2_tri_t_0;
  wire [1:1]pmod_gpio_2_tri_t_1;
  wire [2:2]pmod_gpio_2_tri_t_2;
  wire [3:3]pmod_gpio_2_tri_t_3;
  wire [4:4]pmod_gpio_2_tri_t_4;
  wire [5:5]pmod_gpio_2_tri_t_5;
  wire [6:6]pmod_gpio_2_tri_t_6;
  wire [7:7]pmod_gpio_2_tri_t_7;
  wire rx_clk_out_0;
  wire [0:0]rx_reset;
  wire rx_reset_0;
  wire rx_serdes_clk_0;
  wire rx_serdes_reset_0;
  wire s_axi_aclk_0;
  wire sdi_rxn;
  wire sdi_rxp;
  wire sdi_txn;
  wire sdi_txp;
  wire tx_clk_out_0;
  wire [0:0]tx_reset;
  wire tx_reset_0;
  wire user_rx_reset;
  wire user_tx_reset;

  design_1 design_1_i
       (.board_config_gpio_tri_i(board_config_gpio_tri_i),
        .ctl_gt_reset_all_0(ctl_gt_reset_all_0),
        .ctl_gt_rx_reset_0(ctl_gt_rx_reset_0),
        .ctl_gt_tx_reset_0(ctl_gt_tx_reset_0),
        .ddr4_act_n(ddr4_act_n),
        .ddr4_adr(ddr4_adr),
        .ddr4_ba(ddr4_ba),
        .ddr4_bg(ddr4_bg),
        .ddr4_ck_c(ddr4_ck_c),
        .ddr4_ck_t(ddr4_ck_t),
        .ddr4_cke(ddr4_cke),
        .ddr4_cs_n(ddr4_cs_n),
        .ddr4_dm_n(ddr4_dm_n),
        .ddr4_dq(ddr4_dq),
        .ddr4_dqs_c(ddr4_dqs_c),
        .ddr4_dqs_t(ddr4_dqs_t),
        .ddr4_odt(ddr4_odt),
        .ddr4_reset_n(ddr4_reset_n),
        .ddr4_sysclk_clk_n(ddr4_sysclk_clk_n),
        .ddr4_sysclk_clk_p(ddr4_sysclk_clk_p),
        .dp_aux_n(dp_aux_n),
        .dp_aux_p(dp_aux_p),
        .dp_hpd(dp_hpd),
        .emio_gpio_i(emio_gpio_i),
        .emio_gpio_o(emio_gpio_o),
        .fmc1_gpio_1_tri_i({fmc1_gpio_1_tri_i_31,fmc1_gpio_1_tri_i_30,fmc1_gpio_1_tri_i_29,fmc1_gpio_1_tri_i_28,fmc1_gpio_1_tri_i_27,fmc1_gpio_1_tri_i_26,fmc1_gpio_1_tri_i_25,fmc1_gpio_1_tri_i_24,fmc1_gpio_1_tri_i_23,fmc1_gpio_1_tri_i_22,fmc1_gpio_1_tri_i_21,fmc1_gpio_1_tri_i_20,fmc1_gpio_1_tri_i_19,fmc1_gpio_1_tri_i_18,fmc1_gpio_1_tri_i_17,fmc1_gpio_1_tri_i_16,fmc1_gpio_1_tri_i_15,fmc1_gpio_1_tri_i_14,fmc1_gpio_1_tri_i_13,fmc1_gpio_1_tri_i_12,fmc1_gpio_1_tri_i_11,fmc1_gpio_1_tri_i_10,fmc1_gpio_1_tri_i_9,fmc1_gpio_1_tri_i_8,fmc1_gpio_1_tri_i_7,fmc1_gpio_1_tri_i_6,fmc1_gpio_1_tri_i_5,fmc1_gpio_1_tri_i_4,fmc1_gpio_1_tri_i_3,fmc1_gpio_1_tri_i_2,fmc1_gpio_1_tri_i_1,fmc1_gpio_1_tri_i_0}),
        .fmc1_gpio_1_tri_o({fmc1_gpio_1_tri_o_31,fmc1_gpio_1_tri_o_30,fmc1_gpio_1_tri_o_29,fmc1_gpio_1_tri_o_28,fmc1_gpio_1_tri_o_27,fmc1_gpio_1_tri_o_26,fmc1_gpio_1_tri_o_25,fmc1_gpio_1_tri_o_24,fmc1_gpio_1_tri_o_23,fmc1_gpio_1_tri_o_22,fmc1_gpio_1_tri_o_21,fmc1_gpio_1_tri_o_20,fmc1_gpio_1_tri_o_19,fmc1_gpio_1_tri_o_18,fmc1_gpio_1_tri_o_17,fmc1_gpio_1_tri_o_16,fmc1_gpio_1_tri_o_15,fmc1_gpio_1_tri_o_14,fmc1_gpio_1_tri_o_13,fmc1_gpio_1_tri_o_12,fmc1_gpio_1_tri_o_11,fmc1_gpio_1_tri_o_10,fmc1_gpio_1_tri_o_9,fmc1_gpio_1_tri_o_8,fmc1_gpio_1_tri_o_7,fmc1_gpio_1_tri_o_6,fmc1_gpio_1_tri_o_5,fmc1_gpio_1_tri_o_4,fmc1_gpio_1_tri_o_3,fmc1_gpio_1_tri_o_2,fmc1_gpio_1_tri_o_1,fmc1_gpio_1_tri_o_0}),
        .fmc1_gpio_1_tri_t({fmc1_gpio_1_tri_t_31,fmc1_gpio_1_tri_t_30,fmc1_gpio_1_tri_t_29,fmc1_gpio_1_tri_t_28,fmc1_gpio_1_tri_t_27,fmc1_gpio_1_tri_t_26,fmc1_gpio_1_tri_t_25,fmc1_gpio_1_tri_t_24,fmc1_gpio_1_tri_t_23,fmc1_gpio_1_tri_t_22,fmc1_gpio_1_tri_t_21,fmc1_gpio_1_tri_t_20,fmc1_gpio_1_tri_t_19,fmc1_gpio_1_tri_t_18,fmc1_gpio_1_tri_t_17,fmc1_gpio_1_tri_t_16,fmc1_gpio_1_tri_t_15,fmc1_gpio_1_tri_t_14,fmc1_gpio_1_tri_t_13,fmc1_gpio_1_tri_t_12,fmc1_gpio_1_tri_t_11,fmc1_gpio_1_tri_t_10,fmc1_gpio_1_tri_t_9,fmc1_gpio_1_tri_t_8,fmc1_gpio_1_tri_t_7,fmc1_gpio_1_tri_t_6,fmc1_gpio_1_tri_t_5,fmc1_gpio_1_tri_t_4,fmc1_gpio_1_tri_t_3,fmc1_gpio_1_tri_t_2,fmc1_gpio_1_tri_t_1,fmc1_gpio_1_tri_t_0}),
        .fmc1_gpio_2_tri_i({fmc1_gpio_2_tri_i_31,fmc1_gpio_2_tri_i_30,fmc1_gpio_2_tri_i_29,fmc1_gpio_2_tri_i_28,fmc1_gpio_2_tri_i_27,fmc1_gpio_2_tri_i_26,fmc1_gpio_2_tri_i_25,fmc1_gpio_2_tri_i_24,fmc1_gpio_2_tri_i_23,fmc1_gpio_2_tri_i_22,fmc1_gpio_2_tri_i_21,fmc1_gpio_2_tri_i_20,fmc1_gpio_2_tri_i_19,fmc1_gpio_2_tri_i_18,fmc1_gpio_2_tri_i_17,fmc1_gpio_2_tri_i_16,fmc1_gpio_2_tri_i_15,fmc1_gpio_2_tri_i_14,fmc1_gpio_2_tri_i_13,fmc1_gpio_2_tri_i_12,fmc1_gpio_2_tri_i_11,fmc1_gpio_2_tri_i_10,fmc1_gpio_2_tri_i_9,fmc1_gpio_2_tri_i_8,fmc1_gpio_2_tri_i_7,fmc1_gpio_2_tri_i_6,fmc1_gpio_2_tri_i_5,fmc1_gpio_2_tri_i_4,fmc1_gpio_2_tri_i_3,fmc1_gpio_2_tri_i_2,fmc1_gpio_2_tri_i_1,fmc1_gpio_2_tri_i_0}),
        .fmc1_gpio_2_tri_o({fmc1_gpio_2_tri_o_31,fmc1_gpio_2_tri_o_30,fmc1_gpio_2_tri_o_29,fmc1_gpio_2_tri_o_28,fmc1_gpio_2_tri_o_27,fmc1_gpio_2_tri_o_26,fmc1_gpio_2_tri_o_25,fmc1_gpio_2_tri_o_24,fmc1_gpio_2_tri_o_23,fmc1_gpio_2_tri_o_22,fmc1_gpio_2_tri_o_21,fmc1_gpio_2_tri_o_20,fmc1_gpio_2_tri_o_19,fmc1_gpio_2_tri_o_18,fmc1_gpio_2_tri_o_17,fmc1_gpio_2_tri_o_16,fmc1_gpio_2_tri_o_15,fmc1_gpio_2_tri_o_14,fmc1_gpio_2_tri_o_13,fmc1_gpio_2_tri_o_12,fmc1_gpio_2_tri_o_11,fmc1_gpio_2_tri_o_10,fmc1_gpio_2_tri_o_9,fmc1_gpio_2_tri_o_8,fmc1_gpio_2_tri_o_7,fmc1_gpio_2_tri_o_6,fmc1_gpio_2_tri_o_5,fmc1_gpio_2_tri_o_4,fmc1_gpio_2_tri_o_3,fmc1_gpio_2_tri_o_2,fmc1_gpio_2_tri_o_1,fmc1_gpio_2_tri_o_0}),
        .fmc1_gpio_2_tri_t({fmc1_gpio_2_tri_t_31,fmc1_gpio_2_tri_t_30,fmc1_gpio_2_tri_t_29,fmc1_gpio_2_tri_t_28,fmc1_gpio_2_tri_t_27,fmc1_gpio_2_tri_t_26,fmc1_gpio_2_tri_t_25,fmc1_gpio_2_tri_t_24,fmc1_gpio_2_tri_t_23,fmc1_gpio_2_tri_t_22,fmc1_gpio_2_tri_t_21,fmc1_gpio_2_tri_t_20,fmc1_gpio_2_tri_t_19,fmc1_gpio_2_tri_t_18,fmc1_gpio_2_tri_t_17,fmc1_gpio_2_tri_t_16,fmc1_gpio_2_tri_t_15,fmc1_gpio_2_tri_t_14,fmc1_gpio_2_tri_t_13,fmc1_gpio_2_tri_t_12,fmc1_gpio_2_tri_t_11,fmc1_gpio_2_tri_t_10,fmc1_gpio_2_tri_t_9,fmc1_gpio_2_tri_t_8,fmc1_gpio_2_tri_t_7,fmc1_gpio_2_tri_t_6,fmc1_gpio_2_tri_t_5,fmc1_gpio_2_tri_t_4,fmc1_gpio_2_tri_t_3,fmc1_gpio_2_tri_t_2,fmc1_gpio_2_tri_t_1,fmc1_gpio_2_tri_t_0}),
        .fmc1_gpio_3_tri_i({fmc1_gpio_3_tri_i_7,fmc1_gpio_3_tri_i_6,fmc1_gpio_3_tri_i_5,fmc1_gpio_3_tri_i_4,fmc1_gpio_3_tri_i_3,fmc1_gpio_3_tri_i_2,fmc1_gpio_3_tri_i_1,fmc1_gpio_3_tri_i_0}),
        .fmc1_gpio_3_tri_o({fmc1_gpio_3_tri_o_7,fmc1_gpio_3_tri_o_6,fmc1_gpio_3_tri_o_5,fmc1_gpio_3_tri_o_4,fmc1_gpio_3_tri_o_3,fmc1_gpio_3_tri_o_2,fmc1_gpio_3_tri_o_1,fmc1_gpio_3_tri_o_0}),
        .fmc1_gpio_3_tri_t({fmc1_gpio_3_tri_t_7,fmc1_gpio_3_tri_t_6,fmc1_gpio_3_tri_t_5,fmc1_gpio_3_tri_t_4,fmc1_gpio_3_tri_t_3,fmc1_gpio_3_tri_t_2,fmc1_gpio_3_tri_t_1,fmc1_gpio_3_tri_t_0}),
        .fmc2_gpio_1_tri_i({fmc2_gpio_1_tri_i_19,fmc2_gpio_1_tri_i_18,fmc2_gpio_1_tri_i_17,fmc2_gpio_1_tri_i_16,fmc2_gpio_1_tri_i_15,fmc2_gpio_1_tri_i_14,fmc2_gpio_1_tri_i_13,fmc2_gpio_1_tri_i_12,fmc2_gpio_1_tri_i_11,fmc2_gpio_1_tri_i_10,fmc2_gpio_1_tri_i_9,fmc2_gpio_1_tri_i_8,fmc2_gpio_1_tri_i_7,fmc2_gpio_1_tri_i_6,fmc2_gpio_1_tri_i_5,fmc2_gpio_1_tri_i_4,fmc2_gpio_1_tri_i_3,fmc2_gpio_1_tri_i_2,fmc2_gpio_1_tri_i_1,fmc2_gpio_1_tri_i_0}),
        .fmc2_gpio_1_tri_o({fmc2_gpio_1_tri_o_19,fmc2_gpio_1_tri_o_18,fmc2_gpio_1_tri_o_17,fmc2_gpio_1_tri_o_16,fmc2_gpio_1_tri_o_15,fmc2_gpio_1_tri_o_14,fmc2_gpio_1_tri_o_13,fmc2_gpio_1_tri_o_12,fmc2_gpio_1_tri_o_11,fmc2_gpio_1_tri_o_10,fmc2_gpio_1_tri_o_9,fmc2_gpio_1_tri_o_8,fmc2_gpio_1_tri_o_7,fmc2_gpio_1_tri_o_6,fmc2_gpio_1_tri_o_5,fmc2_gpio_1_tri_o_4,fmc2_gpio_1_tri_o_3,fmc2_gpio_1_tri_o_2,fmc2_gpio_1_tri_o_1,fmc2_gpio_1_tri_o_0}),
        .fmc2_gpio_1_tri_t({fmc2_gpio_1_tri_t_19,fmc2_gpio_1_tri_t_18,fmc2_gpio_1_tri_t_17,fmc2_gpio_1_tri_t_16,fmc2_gpio_1_tri_t_15,fmc2_gpio_1_tri_t_14,fmc2_gpio_1_tri_t_13,fmc2_gpio_1_tri_t_12,fmc2_gpio_1_tri_t_11,fmc2_gpio_1_tri_t_10,fmc2_gpio_1_tri_t_9,fmc2_gpio_1_tri_t_8,fmc2_gpio_1_tri_t_7,fmc2_gpio_1_tri_t_6,fmc2_gpio_1_tri_t_5,fmc2_gpio_1_tri_t_4,fmc2_gpio_1_tri_t_3,fmc2_gpio_1_tri_t_2,fmc2_gpio_1_tri_t_1,fmc2_gpio_1_tri_t_0}),
        .fmc2_gpio_2_tri_i({fmc2_gpio_2_tri_i_19,fmc2_gpio_2_tri_i_18,fmc2_gpio_2_tri_i_17,fmc2_gpio_2_tri_i_16,fmc2_gpio_2_tri_i_15,fmc2_gpio_2_tri_i_14,fmc2_gpio_2_tri_i_13,fmc2_gpio_2_tri_i_12,fmc2_gpio_2_tri_i_11,fmc2_gpio_2_tri_i_10,fmc2_gpio_2_tri_i_9,fmc2_gpio_2_tri_i_8,fmc2_gpio_2_tri_i_7,fmc2_gpio_2_tri_i_6,fmc2_gpio_2_tri_i_5,fmc2_gpio_2_tri_i_4,fmc2_gpio_2_tri_i_3,fmc2_gpio_2_tri_i_2,fmc2_gpio_2_tri_i_1,fmc2_gpio_2_tri_i_0}),
        .fmc2_gpio_2_tri_o({fmc2_gpio_2_tri_o_19,fmc2_gpio_2_tri_o_18,fmc2_gpio_2_tri_o_17,fmc2_gpio_2_tri_o_16,fmc2_gpio_2_tri_o_15,fmc2_gpio_2_tri_o_14,fmc2_gpio_2_tri_o_13,fmc2_gpio_2_tri_o_12,fmc2_gpio_2_tri_o_11,fmc2_gpio_2_tri_o_10,fmc2_gpio_2_tri_o_9,fmc2_gpio_2_tri_o_8,fmc2_gpio_2_tri_o_7,fmc2_gpio_2_tri_o_6,fmc2_gpio_2_tri_o_5,fmc2_gpio_2_tri_o_4,fmc2_gpio_2_tri_o_3,fmc2_gpio_2_tri_o_2,fmc2_gpio_2_tri_o_1,fmc2_gpio_2_tri_o_0}),
        .fmc2_gpio_2_tri_t({fmc2_gpio_2_tri_t_19,fmc2_gpio_2_tri_t_18,fmc2_gpio_2_tri_t_17,fmc2_gpio_2_tri_t_16,fmc2_gpio_2_tri_t_15,fmc2_gpio_2_tri_t_14,fmc2_gpio_2_tri_t_13,fmc2_gpio_2_tri_t_12,fmc2_gpio_2_tri_t_11,fmc2_gpio_2_tri_t_10,fmc2_gpio_2_tri_t_9,fmc2_gpio_2_tri_t_8,fmc2_gpio_2_tri_t_7,fmc2_gpio_2_tri_t_6,fmc2_gpio_2_tri_t_5,fmc2_gpio_2_tri_t_4,fmc2_gpio_2_tri_t_3,fmc2_gpio_2_tri_t_2,fmc2_gpio_2_tri_t_1,fmc2_gpio_2_tri_t_0}),
        .gem_3_mdio_mdc(gem_3_mdio_mdc),
        .gem_3_mdio_mdio_i(gem_3_mdio_mdio_i),
        .gem_3_mdio_mdio_o(gem_3_mdio_mdio_o),
        .gem_3_mdio_mdio_t(gem_3_mdio_mdio_t),
        .gt_loopback_out_0(gt_loopback_out_0),
        .gt_rx_serdes_interface_0_ch_rxdata(gt_rx_serdes_interface_0_ch_rxdata),
        .gt_rx_serdes_interface_0_ch_rxdatavalid(gt_rx_serdes_interface_0_ch_rxdatavalid),
        .gt_rx_serdes_interface_0_ch_rxgearboxslip(gt_rx_serdes_interface_0_ch_rxgearboxslip),
        .gt_rx_serdes_interface_0_ch_rxheader(gt_rx_serdes_interface_0_ch_rxheader),
        .gt_rx_serdes_interface_0_ch_rxheadervalid(gt_rx_serdes_interface_0_ch_rxheadervalid),
        .gt_tx_serdes_interface_0_ch_txdata(gt_tx_serdes_interface_0_ch_txdata),
        .gt_tx_serdes_interface_0_ch_txheader(gt_tx_serdes_interface_0_ch_txheader),
        .gtwiz_reset_rx_done_0(gtwiz_reset_rx_done_0),
        .gtwiz_reset_tx_done_0(gtwiz_reset_tx_done_0),
        .intf_0_qpll1lock_in(intf_0_qpll1lock_in),
        .intf_0_qpll1out_clk_in(intf_0_qpll1out_clk_in),
        .intf_0_qpll1out_refclk_in(intf_0_qpll1out_refclk_in),
        .intf_0_qpll1reset_out(intf_0_qpll1reset_out),
        .peripheral_reset_125M(peripheral_reset_125M),
        .pl_resetn0(pl_resetn0),
        .pmod_gpio_1_tri_i({pmod_gpio_1_tri_i_7,pmod_gpio_1_tri_i_6,pmod_gpio_1_tri_i_5,pmod_gpio_1_tri_i_4,pmod_gpio_1_tri_i_3,pmod_gpio_1_tri_i_2,pmod_gpio_1_tri_i_1,pmod_gpio_1_tri_i_0}),
        .pmod_gpio_1_tri_o({pmod_gpio_1_tri_o_7,pmod_gpio_1_tri_o_6,pmod_gpio_1_tri_o_5,pmod_gpio_1_tri_o_4,pmod_gpio_1_tri_o_3,pmod_gpio_1_tri_o_2,pmod_gpio_1_tri_o_1,pmod_gpio_1_tri_o_0}),
        .pmod_gpio_1_tri_t({pmod_gpio_1_tri_t_7,pmod_gpio_1_tri_t_6,pmod_gpio_1_tri_t_5,pmod_gpio_1_tri_t_4,pmod_gpio_1_tri_t_3,pmod_gpio_1_tri_t_2,pmod_gpio_1_tri_t_1,pmod_gpio_1_tri_t_0}),
        .pmod_gpio_2_tri_i({pmod_gpio_2_tri_i_7,pmod_gpio_2_tri_i_6,pmod_gpio_2_tri_i_5,pmod_gpio_2_tri_i_4,pmod_gpio_2_tri_i_3,pmod_gpio_2_tri_i_2,pmod_gpio_2_tri_i_1,pmod_gpio_2_tri_i_0}),
        .pmod_gpio_2_tri_o({pmod_gpio_2_tri_o_7,pmod_gpio_2_tri_o_6,pmod_gpio_2_tri_o_5,pmod_gpio_2_tri_o_4,pmod_gpio_2_tri_o_3,pmod_gpio_2_tri_o_2,pmod_gpio_2_tri_o_1,pmod_gpio_2_tri_o_0}),
        .pmod_gpio_2_tri_t({pmod_gpio_2_tri_t_7,pmod_gpio_2_tri_t_6,pmod_gpio_2_tri_t_5,pmod_gpio_2_tri_t_4,pmod_gpio_2_tri_t_3,pmod_gpio_2_tri_t_2,pmod_gpio_2_tri_t_1,pmod_gpio_2_tri_t_0}),
        .rx_clk_out_0(rx_clk_out_0),
        .rx_reset(rx_reset),
        .rx_reset_0(rx_reset_0),
        .rx_serdes_clk_0(rx_serdes_clk_0),
        .rx_serdes_reset_0(rx_serdes_reset_0),
        .s_axi_aclk_0(s_axi_aclk_0),
        .sdi_rxn(sdi_rxn),
        .sdi_rxp(sdi_rxp),
        .sdi_txn(sdi_txn),
        .sdi_txp(sdi_txp),
        .tx_clk_out_0(tx_clk_out_0),
        .tx_reset(tx_reset),
        .tx_reset_0(tx_reset_0),
        .user_rx_reset(user_rx_reset),
        .user_tx_reset(user_tx_reset));
  IOBUF fmc1_gpio_1_tri_iobuf_0
       (.I(fmc1_gpio_1_tri_o_0),
        .IO(fmc1_gpio_1_tri_io[0]),
        .O(fmc1_gpio_1_tri_i_0),
        .T(fmc1_gpio_1_tri_t_0));
  IOBUF fmc1_gpio_1_tri_iobuf_1
       (.I(fmc1_gpio_1_tri_o_1),
        .IO(fmc1_gpio_1_tri_io[1]),
        .O(fmc1_gpio_1_tri_i_1),
        .T(fmc1_gpio_1_tri_t_1));
  IOBUF fmc1_gpio_1_tri_iobuf_10
       (.I(fmc1_gpio_1_tri_o_10),
        .IO(fmc1_gpio_1_tri_io[10]),
        .O(fmc1_gpio_1_tri_i_10),
        .T(fmc1_gpio_1_tri_t_10));
  IOBUF fmc1_gpio_1_tri_iobuf_11
       (.I(fmc1_gpio_1_tri_o_11),
        .IO(fmc1_gpio_1_tri_io[11]),
        .O(fmc1_gpio_1_tri_i_11),
        .T(fmc1_gpio_1_tri_t_11));
  IOBUF fmc1_gpio_1_tri_iobuf_12
       (.I(fmc1_gpio_1_tri_o_12),
        .IO(fmc1_gpio_1_tri_io[12]),
        .O(fmc1_gpio_1_tri_i_12),
        .T(fmc1_gpio_1_tri_t_12));
  IOBUF fmc1_gpio_1_tri_iobuf_13
       (.I(fmc1_gpio_1_tri_o_13),
        .IO(fmc1_gpio_1_tri_io[13]),
        .O(fmc1_gpio_1_tri_i_13),
        .T(fmc1_gpio_1_tri_t_13));
  IOBUF fmc1_gpio_1_tri_iobuf_14
       (.I(fmc1_gpio_1_tri_o_14),
        .IO(fmc1_gpio_1_tri_io[14]),
        .O(fmc1_gpio_1_tri_i_14),
        .T(fmc1_gpio_1_tri_t_14));
  IOBUF fmc1_gpio_1_tri_iobuf_15
       (.I(fmc1_gpio_1_tri_o_15),
        .IO(fmc1_gpio_1_tri_io[15]),
        .O(fmc1_gpio_1_tri_i_15),
        .T(fmc1_gpio_1_tri_t_15));
  IOBUF fmc1_gpio_1_tri_iobuf_16
       (.I(fmc1_gpio_1_tri_o_16),
        .IO(fmc1_gpio_1_tri_io[16]),
        .O(fmc1_gpio_1_tri_i_16),
        .T(fmc1_gpio_1_tri_t_16));
  IOBUF fmc1_gpio_1_tri_iobuf_17
       (.I(fmc1_gpio_1_tri_o_17),
        .IO(fmc1_gpio_1_tri_io[17]),
        .O(fmc1_gpio_1_tri_i_17),
        .T(fmc1_gpio_1_tri_t_17));
  IOBUF fmc1_gpio_1_tri_iobuf_18
       (.I(fmc1_gpio_1_tri_o_18),
        .IO(fmc1_gpio_1_tri_io[18]),
        .O(fmc1_gpio_1_tri_i_18),
        .T(fmc1_gpio_1_tri_t_18));
  IOBUF fmc1_gpio_1_tri_iobuf_19
       (.I(fmc1_gpio_1_tri_o_19),
        .IO(fmc1_gpio_1_tri_io[19]),
        .O(fmc1_gpio_1_tri_i_19),
        .T(fmc1_gpio_1_tri_t_19));
  IOBUF fmc1_gpio_1_tri_iobuf_2
       (.I(fmc1_gpio_1_tri_o_2),
        .IO(fmc1_gpio_1_tri_io[2]),
        .O(fmc1_gpio_1_tri_i_2),
        .T(fmc1_gpio_1_tri_t_2));
  IOBUF fmc1_gpio_1_tri_iobuf_20
       (.I(fmc1_gpio_1_tri_o_20),
        .IO(fmc1_gpio_1_tri_io[20]),
        .O(fmc1_gpio_1_tri_i_20),
        .T(fmc1_gpio_1_tri_t_20));
  IOBUF fmc1_gpio_1_tri_iobuf_21
       (.I(fmc1_gpio_1_tri_o_21),
        .IO(fmc1_gpio_1_tri_io[21]),
        .O(fmc1_gpio_1_tri_i_21),
        .T(fmc1_gpio_1_tri_t_21));
  IOBUF fmc1_gpio_1_tri_iobuf_22
       (.I(fmc1_gpio_1_tri_o_22),
        .IO(fmc1_gpio_1_tri_io[22]),
        .O(fmc1_gpio_1_tri_i_22),
        .T(fmc1_gpio_1_tri_t_22));
  IOBUF fmc1_gpio_1_tri_iobuf_23
       (.I(fmc1_gpio_1_tri_o_23),
        .IO(fmc1_gpio_1_tri_io[23]),
        .O(fmc1_gpio_1_tri_i_23),
        .T(fmc1_gpio_1_tri_t_23));
  IOBUF fmc1_gpio_1_tri_iobuf_24
       (.I(fmc1_gpio_1_tri_o_24),
        .IO(fmc1_gpio_1_tri_io[24]),
        .O(fmc1_gpio_1_tri_i_24),
        .T(fmc1_gpio_1_tri_t_24));
  IOBUF fmc1_gpio_1_tri_iobuf_25
       (.I(fmc1_gpio_1_tri_o_25),
        .IO(fmc1_gpio_1_tri_io[25]),
        .O(fmc1_gpio_1_tri_i_25),
        .T(fmc1_gpio_1_tri_t_25));
  IOBUF fmc1_gpio_1_tri_iobuf_26
       (.I(fmc1_gpio_1_tri_o_26),
        .IO(fmc1_gpio_1_tri_io[26]),
        .O(fmc1_gpio_1_tri_i_26),
        .T(fmc1_gpio_1_tri_t_26));
  IOBUF fmc1_gpio_1_tri_iobuf_27
       (.I(fmc1_gpio_1_tri_o_27),
        .IO(fmc1_gpio_1_tri_io[27]),
        .O(fmc1_gpio_1_tri_i_27),
        .T(fmc1_gpio_1_tri_t_27));
  IOBUF fmc1_gpio_1_tri_iobuf_28
       (.I(fmc1_gpio_1_tri_o_28),
        .IO(fmc1_gpio_1_tri_io[28]),
        .O(fmc1_gpio_1_tri_i_28),
        .T(fmc1_gpio_1_tri_t_28));
  IOBUF fmc1_gpio_1_tri_iobuf_29
       (.I(fmc1_gpio_1_tri_o_29),
        .IO(fmc1_gpio_1_tri_io[29]),
        .O(fmc1_gpio_1_tri_i_29),
        .T(fmc1_gpio_1_tri_t_29));
  IOBUF fmc1_gpio_1_tri_iobuf_3
       (.I(fmc1_gpio_1_tri_o_3),
        .IO(fmc1_gpio_1_tri_io[3]),
        .O(fmc1_gpio_1_tri_i_3),
        .T(fmc1_gpio_1_tri_t_3));
  IOBUF fmc1_gpio_1_tri_iobuf_30
       (.I(fmc1_gpio_1_tri_o_30),
        .IO(fmc1_gpio_1_tri_io[30]),
        .O(fmc1_gpio_1_tri_i_30),
        .T(fmc1_gpio_1_tri_t_30));
  IOBUF fmc1_gpio_1_tri_iobuf_31
       (.I(fmc1_gpio_1_tri_o_31),
        .IO(fmc1_gpio_1_tri_io[31]),
        .O(fmc1_gpio_1_tri_i_31),
        .T(fmc1_gpio_1_tri_t_31));
  IOBUF fmc1_gpio_1_tri_iobuf_4
       (.I(fmc1_gpio_1_tri_o_4),
        .IO(fmc1_gpio_1_tri_io[4]),
        .O(fmc1_gpio_1_tri_i_4),
        .T(fmc1_gpio_1_tri_t_4));
  IOBUF fmc1_gpio_1_tri_iobuf_5
       (.I(fmc1_gpio_1_tri_o_5),
        .IO(fmc1_gpio_1_tri_io[5]),
        .O(fmc1_gpio_1_tri_i_5),
        .T(fmc1_gpio_1_tri_t_5));
  IOBUF fmc1_gpio_1_tri_iobuf_6
       (.I(fmc1_gpio_1_tri_o_6),
        .IO(fmc1_gpio_1_tri_io[6]),
        .O(fmc1_gpio_1_tri_i_6),
        .T(fmc1_gpio_1_tri_t_6));
  IOBUF fmc1_gpio_1_tri_iobuf_7
       (.I(fmc1_gpio_1_tri_o_7),
        .IO(fmc1_gpio_1_tri_io[7]),
        .O(fmc1_gpio_1_tri_i_7),
        .T(fmc1_gpio_1_tri_t_7));
  IOBUF fmc1_gpio_1_tri_iobuf_8
       (.I(fmc1_gpio_1_tri_o_8),
        .IO(fmc1_gpio_1_tri_io[8]),
        .O(fmc1_gpio_1_tri_i_8),
        .T(fmc1_gpio_1_tri_t_8));
  IOBUF fmc1_gpio_1_tri_iobuf_9
       (.I(fmc1_gpio_1_tri_o_9),
        .IO(fmc1_gpio_1_tri_io[9]),
        .O(fmc1_gpio_1_tri_i_9),
        .T(fmc1_gpio_1_tri_t_9));
  IOBUF fmc1_gpio_2_tri_iobuf_0
       (.I(fmc1_gpio_2_tri_o_0),
        .IO(fmc1_gpio_2_tri_io[0]),
        .O(fmc1_gpio_2_tri_i_0),
        .T(fmc1_gpio_2_tri_t_0));
  IOBUF fmc1_gpio_2_tri_iobuf_1
       (.I(fmc1_gpio_2_tri_o_1),
        .IO(fmc1_gpio_2_tri_io[1]),
        .O(fmc1_gpio_2_tri_i_1),
        .T(fmc1_gpio_2_tri_t_1));
  IOBUF fmc1_gpio_2_tri_iobuf_10
       (.I(fmc1_gpio_2_tri_o_10),
        .IO(fmc1_gpio_2_tri_io[10]),
        .O(fmc1_gpio_2_tri_i_10),
        .T(fmc1_gpio_2_tri_t_10));
  IOBUF fmc1_gpio_2_tri_iobuf_11
       (.I(fmc1_gpio_2_tri_o_11),
        .IO(fmc1_gpio_2_tri_io[11]),
        .O(fmc1_gpio_2_tri_i_11),
        .T(fmc1_gpio_2_tri_t_11));
  IOBUF fmc1_gpio_2_tri_iobuf_12
       (.I(fmc1_gpio_2_tri_o_12),
        .IO(fmc1_gpio_2_tri_io[12]),
        .O(fmc1_gpio_2_tri_i_12),
        .T(fmc1_gpio_2_tri_t_12));
  IOBUF fmc1_gpio_2_tri_iobuf_13
       (.I(fmc1_gpio_2_tri_o_13),
        .IO(fmc1_gpio_2_tri_io[13]),
        .O(fmc1_gpio_2_tri_i_13),
        .T(fmc1_gpio_2_tri_t_13));
  IOBUF fmc1_gpio_2_tri_iobuf_14
       (.I(fmc1_gpio_2_tri_o_14),
        .IO(fmc1_gpio_2_tri_io[14]),
        .O(fmc1_gpio_2_tri_i_14),
        .T(fmc1_gpio_2_tri_t_14));
  IOBUF fmc1_gpio_2_tri_iobuf_15
       (.I(fmc1_gpio_2_tri_o_15),
        .IO(fmc1_gpio_2_tri_io[15]),
        .O(fmc1_gpio_2_tri_i_15),
        .T(fmc1_gpio_2_tri_t_15));
  IOBUF fmc1_gpio_2_tri_iobuf_16
       (.I(fmc1_gpio_2_tri_o_16),
        .IO(fmc1_gpio_2_tri_io[16]),
        .O(fmc1_gpio_2_tri_i_16),
        .T(fmc1_gpio_2_tri_t_16));
  IOBUF fmc1_gpio_2_tri_iobuf_17
       (.I(fmc1_gpio_2_tri_o_17),
        .IO(fmc1_gpio_2_tri_io[17]),
        .O(fmc1_gpio_2_tri_i_17),
        .T(fmc1_gpio_2_tri_t_17));
  IOBUF fmc1_gpio_2_tri_iobuf_18
       (.I(fmc1_gpio_2_tri_o_18),
        .IO(fmc1_gpio_2_tri_io[18]),
        .O(fmc1_gpio_2_tri_i_18),
        .T(fmc1_gpio_2_tri_t_18));
  IOBUF fmc1_gpio_2_tri_iobuf_19
       (.I(fmc1_gpio_2_tri_o_19),
        .IO(fmc1_gpio_2_tri_io[19]),
        .O(fmc1_gpio_2_tri_i_19),
        .T(fmc1_gpio_2_tri_t_19));
  IOBUF fmc1_gpio_2_tri_iobuf_2
       (.I(fmc1_gpio_2_tri_o_2),
        .IO(fmc1_gpio_2_tri_io[2]),
        .O(fmc1_gpio_2_tri_i_2),
        .T(fmc1_gpio_2_tri_t_2));
  IOBUF fmc1_gpio_2_tri_iobuf_20
       (.I(fmc1_gpio_2_tri_o_20),
        .IO(fmc1_gpio_2_tri_io[20]),
        .O(fmc1_gpio_2_tri_i_20),
        .T(fmc1_gpio_2_tri_t_20));
  IOBUF fmc1_gpio_2_tri_iobuf_21
       (.I(fmc1_gpio_2_tri_o_21),
        .IO(fmc1_gpio_2_tri_io[21]),
        .O(fmc1_gpio_2_tri_i_21),
        .T(fmc1_gpio_2_tri_t_21));
  IOBUF fmc1_gpio_2_tri_iobuf_22
       (.I(fmc1_gpio_2_tri_o_22),
        .IO(fmc1_gpio_2_tri_io[22]),
        .O(fmc1_gpio_2_tri_i_22),
        .T(fmc1_gpio_2_tri_t_22));
  IOBUF fmc1_gpio_2_tri_iobuf_23
       (.I(fmc1_gpio_2_tri_o_23),
        .IO(fmc1_gpio_2_tri_io[23]),
        .O(fmc1_gpio_2_tri_i_23),
        .T(fmc1_gpio_2_tri_t_23));
  IOBUF fmc1_gpio_2_tri_iobuf_24
       (.I(fmc1_gpio_2_tri_o_24),
        .IO(fmc1_gpio_2_tri_io[24]),
        .O(fmc1_gpio_2_tri_i_24),
        .T(fmc1_gpio_2_tri_t_24));
  IOBUF fmc1_gpio_2_tri_iobuf_25
       (.I(fmc1_gpio_2_tri_o_25),
        .IO(fmc1_gpio_2_tri_io[25]),
        .O(fmc1_gpio_2_tri_i_25),
        .T(fmc1_gpio_2_tri_t_25));
  IOBUF fmc1_gpio_2_tri_iobuf_26
       (.I(fmc1_gpio_2_tri_o_26),
        .IO(fmc1_gpio_2_tri_io[26]),
        .O(fmc1_gpio_2_tri_i_26),
        .T(fmc1_gpio_2_tri_t_26));
  IOBUF fmc1_gpio_2_tri_iobuf_27
       (.I(fmc1_gpio_2_tri_o_27),
        .IO(fmc1_gpio_2_tri_io[27]),
        .O(fmc1_gpio_2_tri_i_27),
        .T(fmc1_gpio_2_tri_t_27));
  IOBUF fmc1_gpio_2_tri_iobuf_28
       (.I(fmc1_gpio_2_tri_o_28),
        .IO(fmc1_gpio_2_tri_io[28]),
        .O(fmc1_gpio_2_tri_i_28),
        .T(fmc1_gpio_2_tri_t_28));
  IOBUF fmc1_gpio_2_tri_iobuf_29
       (.I(fmc1_gpio_2_tri_o_29),
        .IO(fmc1_gpio_2_tri_io[29]),
        .O(fmc1_gpio_2_tri_i_29),
        .T(fmc1_gpio_2_tri_t_29));
  IOBUF fmc1_gpio_2_tri_iobuf_3
       (.I(fmc1_gpio_2_tri_o_3),
        .IO(fmc1_gpio_2_tri_io[3]),
        .O(fmc1_gpio_2_tri_i_3),
        .T(fmc1_gpio_2_tri_t_3));
  IOBUF fmc1_gpio_2_tri_iobuf_30
       (.I(fmc1_gpio_2_tri_o_30),
        .IO(fmc1_gpio_2_tri_io[30]),
        .O(fmc1_gpio_2_tri_i_30),
        .T(fmc1_gpio_2_tri_t_30));
  IOBUF fmc1_gpio_2_tri_iobuf_31
       (.I(fmc1_gpio_2_tri_o_31),
        .IO(fmc1_gpio_2_tri_io[31]),
        .O(fmc1_gpio_2_tri_i_31),
        .T(fmc1_gpio_2_tri_t_31));
  IOBUF fmc1_gpio_2_tri_iobuf_4
       (.I(fmc1_gpio_2_tri_o_4),
        .IO(fmc1_gpio_2_tri_io[4]),
        .O(fmc1_gpio_2_tri_i_4),
        .T(fmc1_gpio_2_tri_t_4));
  IOBUF fmc1_gpio_2_tri_iobuf_5
       (.I(fmc1_gpio_2_tri_o_5),
        .IO(fmc1_gpio_2_tri_io[5]),
        .O(fmc1_gpio_2_tri_i_5),
        .T(fmc1_gpio_2_tri_t_5));
  IOBUF fmc1_gpio_2_tri_iobuf_6
       (.I(fmc1_gpio_2_tri_o_6),
        .IO(fmc1_gpio_2_tri_io[6]),
        .O(fmc1_gpio_2_tri_i_6),
        .T(fmc1_gpio_2_tri_t_6));
  IOBUF fmc1_gpio_2_tri_iobuf_7
       (.I(fmc1_gpio_2_tri_o_7),
        .IO(fmc1_gpio_2_tri_io[7]),
        .O(fmc1_gpio_2_tri_i_7),
        .T(fmc1_gpio_2_tri_t_7));
  IOBUF fmc1_gpio_2_tri_iobuf_8
       (.I(fmc1_gpio_2_tri_o_8),
        .IO(fmc1_gpio_2_tri_io[8]),
        .O(fmc1_gpio_2_tri_i_8),
        .T(fmc1_gpio_2_tri_t_8));
  IOBUF fmc1_gpio_2_tri_iobuf_9
       (.I(fmc1_gpio_2_tri_o_9),
        .IO(fmc1_gpio_2_tri_io[9]),
        .O(fmc1_gpio_2_tri_i_9),
        .T(fmc1_gpio_2_tri_t_9));
  IOBUF fmc1_gpio_3_tri_iobuf_0
       (.I(fmc1_gpio_3_tri_o_0),
        .IO(fmc1_gpio_3_tri_io[0]),
        .O(fmc1_gpio_3_tri_i_0),
        .T(fmc1_gpio_3_tri_t_0));
  IOBUF fmc1_gpio_3_tri_iobuf_1
       (.I(fmc1_gpio_3_tri_o_1),
        .IO(fmc1_gpio_3_tri_io[1]),
        .O(fmc1_gpio_3_tri_i_1),
        .T(fmc1_gpio_3_tri_t_1));
  IOBUF fmc1_gpio_3_tri_iobuf_2
       (.I(fmc1_gpio_3_tri_o_2),
        .IO(fmc1_gpio_3_tri_io[2]),
        .O(fmc1_gpio_3_tri_i_2),
        .T(fmc1_gpio_3_tri_t_2));
  IOBUF fmc1_gpio_3_tri_iobuf_3
       (.I(fmc1_gpio_3_tri_o_3),
        .IO(fmc1_gpio_3_tri_io[3]),
        .O(fmc1_gpio_3_tri_i_3),
        .T(fmc1_gpio_3_tri_t_3));
  IOBUF fmc1_gpio_3_tri_iobuf_4
       (.I(fmc1_gpio_3_tri_o_4),
        .IO(fmc1_gpio_3_tri_io[4]),
        .O(fmc1_gpio_3_tri_i_4),
        .T(fmc1_gpio_3_tri_t_4));
  IOBUF fmc1_gpio_3_tri_iobuf_5
       (.I(fmc1_gpio_3_tri_o_5),
        .IO(fmc1_gpio_3_tri_io[5]),
        .O(fmc1_gpio_3_tri_i_5),
        .T(fmc1_gpio_3_tri_t_5));
  IOBUF fmc1_gpio_3_tri_iobuf_6
       (.I(fmc1_gpio_3_tri_o_6),
        .IO(fmc1_gpio_3_tri_io[6]),
        .O(fmc1_gpio_3_tri_i_6),
        .T(fmc1_gpio_3_tri_t_6));
  IOBUF fmc1_gpio_3_tri_iobuf_7
       (.I(fmc1_gpio_3_tri_o_7),
        .IO(fmc1_gpio_3_tri_io[7]),
        .O(fmc1_gpio_3_tri_i_7),
        .T(fmc1_gpio_3_tri_t_7));
  IOBUF fmc2_gpio_1_tri_iobuf_0
       (.I(fmc2_gpio_1_tri_o_0),
        .IO(fmc2_gpio_1_tri_io[0]),
        .O(fmc2_gpio_1_tri_i_0),
        .T(fmc2_gpio_1_tri_t_0));
  IOBUF fmc2_gpio_1_tri_iobuf_1
       (.I(fmc2_gpio_1_tri_o_1),
        .IO(fmc2_gpio_1_tri_io[1]),
        .O(fmc2_gpio_1_tri_i_1),
        .T(fmc2_gpio_1_tri_t_1));
  IOBUF fmc2_gpio_1_tri_iobuf_10
       (.I(fmc2_gpio_1_tri_o_10),
        .IO(fmc2_gpio_1_tri_io[10]),
        .O(fmc2_gpio_1_tri_i_10),
        .T(fmc2_gpio_1_tri_t_10));
  IOBUF fmc2_gpio_1_tri_iobuf_11
       (.I(fmc2_gpio_1_tri_o_11),
        .IO(fmc2_gpio_1_tri_io[11]),
        .O(fmc2_gpio_1_tri_i_11),
        .T(fmc2_gpio_1_tri_t_11));
  IOBUF fmc2_gpio_1_tri_iobuf_12
       (.I(fmc2_gpio_1_tri_o_12),
        .IO(fmc2_gpio_1_tri_io[12]),
        .O(fmc2_gpio_1_tri_i_12),
        .T(fmc2_gpio_1_tri_t_12));
  IOBUF fmc2_gpio_1_tri_iobuf_13
       (.I(fmc2_gpio_1_tri_o_13),
        .IO(fmc2_gpio_1_tri_io[13]),
        .O(fmc2_gpio_1_tri_i_13),
        .T(fmc2_gpio_1_tri_t_13));
  IOBUF fmc2_gpio_1_tri_iobuf_14
       (.I(fmc2_gpio_1_tri_o_14),
        .IO(fmc2_gpio_1_tri_io[14]),
        .O(fmc2_gpio_1_tri_i_14),
        .T(fmc2_gpio_1_tri_t_14));
  IOBUF fmc2_gpio_1_tri_iobuf_15
       (.I(fmc2_gpio_1_tri_o_15),
        .IO(fmc2_gpio_1_tri_io[15]),
        .O(fmc2_gpio_1_tri_i_15),
        .T(fmc2_gpio_1_tri_t_15));
  IOBUF fmc2_gpio_1_tri_iobuf_16
       (.I(fmc2_gpio_1_tri_o_16),
        .IO(fmc2_gpio_1_tri_io[16]),
        .O(fmc2_gpio_1_tri_i_16),
        .T(fmc2_gpio_1_tri_t_16));
  IOBUF fmc2_gpio_1_tri_iobuf_17
       (.I(fmc2_gpio_1_tri_o_17),
        .IO(fmc2_gpio_1_tri_io[17]),
        .O(fmc2_gpio_1_tri_i_17),
        .T(fmc2_gpio_1_tri_t_17));
  IOBUF fmc2_gpio_1_tri_iobuf_18
       (.I(fmc2_gpio_1_tri_o_18),
        .IO(fmc2_gpio_1_tri_io[18]),
        .O(fmc2_gpio_1_tri_i_18),
        .T(fmc2_gpio_1_tri_t_18));
  IOBUF fmc2_gpio_1_tri_iobuf_19
       (.I(fmc2_gpio_1_tri_o_19),
        .IO(fmc2_gpio_1_tri_io[19]),
        .O(fmc2_gpio_1_tri_i_19),
        .T(fmc2_gpio_1_tri_t_19));
  IOBUF fmc2_gpio_1_tri_iobuf_2
       (.I(fmc2_gpio_1_tri_o_2),
        .IO(fmc2_gpio_1_tri_io[2]),
        .O(fmc2_gpio_1_tri_i_2),
        .T(fmc2_gpio_1_tri_t_2));
  IOBUF fmc2_gpio_1_tri_iobuf_3
       (.I(fmc2_gpio_1_tri_o_3),
        .IO(fmc2_gpio_1_tri_io[3]),
        .O(fmc2_gpio_1_tri_i_3),
        .T(fmc2_gpio_1_tri_t_3));
  IOBUF fmc2_gpio_1_tri_iobuf_4
       (.I(fmc2_gpio_1_tri_o_4),
        .IO(fmc2_gpio_1_tri_io[4]),
        .O(fmc2_gpio_1_tri_i_4),
        .T(fmc2_gpio_1_tri_t_4));
  IOBUF fmc2_gpio_1_tri_iobuf_5
       (.I(fmc2_gpio_1_tri_o_5),
        .IO(fmc2_gpio_1_tri_io[5]),
        .O(fmc2_gpio_1_tri_i_5),
        .T(fmc2_gpio_1_tri_t_5));
  IOBUF fmc2_gpio_1_tri_iobuf_6
       (.I(fmc2_gpio_1_tri_o_6),
        .IO(fmc2_gpio_1_tri_io[6]),
        .O(fmc2_gpio_1_tri_i_6),
        .T(fmc2_gpio_1_tri_t_6));
  IOBUF fmc2_gpio_1_tri_iobuf_7
       (.I(fmc2_gpio_1_tri_o_7),
        .IO(fmc2_gpio_1_tri_io[7]),
        .O(fmc2_gpio_1_tri_i_7),
        .T(fmc2_gpio_1_tri_t_7));
  IOBUF fmc2_gpio_1_tri_iobuf_8
       (.I(fmc2_gpio_1_tri_o_8),
        .IO(fmc2_gpio_1_tri_io[8]),
        .O(fmc2_gpio_1_tri_i_8),
        .T(fmc2_gpio_1_tri_t_8));
  IOBUF fmc2_gpio_1_tri_iobuf_9
       (.I(fmc2_gpio_1_tri_o_9),
        .IO(fmc2_gpio_1_tri_io[9]),
        .O(fmc2_gpio_1_tri_i_9),
        .T(fmc2_gpio_1_tri_t_9));
  IOBUF fmc2_gpio_2_tri_iobuf_0
       (.I(fmc2_gpio_2_tri_o_0),
        .IO(fmc2_gpio_2_tri_io[0]),
        .O(fmc2_gpio_2_tri_i_0),
        .T(fmc2_gpio_2_tri_t_0));
  IOBUF fmc2_gpio_2_tri_iobuf_1
       (.I(fmc2_gpio_2_tri_o_1),
        .IO(fmc2_gpio_2_tri_io[1]),
        .O(fmc2_gpio_2_tri_i_1),
        .T(fmc2_gpio_2_tri_t_1));
  IOBUF fmc2_gpio_2_tri_iobuf_10
       (.I(fmc2_gpio_2_tri_o_10),
        .IO(fmc2_gpio_2_tri_io[10]),
        .O(fmc2_gpio_2_tri_i_10),
        .T(fmc2_gpio_2_tri_t_10));
  IOBUF fmc2_gpio_2_tri_iobuf_11
       (.I(fmc2_gpio_2_tri_o_11),
        .IO(fmc2_gpio_2_tri_io[11]),
        .O(fmc2_gpio_2_tri_i_11),
        .T(fmc2_gpio_2_tri_t_11));
  IOBUF fmc2_gpio_2_tri_iobuf_12
       (.I(fmc2_gpio_2_tri_o_12),
        .IO(fmc2_gpio_2_tri_io[12]),
        .O(fmc2_gpio_2_tri_i_12),
        .T(fmc2_gpio_2_tri_t_12));
  IOBUF fmc2_gpio_2_tri_iobuf_13
       (.I(fmc2_gpio_2_tri_o_13),
        .IO(fmc2_gpio_2_tri_io[13]),
        .O(fmc2_gpio_2_tri_i_13),
        .T(fmc2_gpio_2_tri_t_13));
  IOBUF fmc2_gpio_2_tri_iobuf_14
       (.I(fmc2_gpio_2_tri_o_14),
        .IO(fmc2_gpio_2_tri_io[14]),
        .O(fmc2_gpio_2_tri_i_14),
        .T(fmc2_gpio_2_tri_t_14));
  IOBUF fmc2_gpio_2_tri_iobuf_15
       (.I(fmc2_gpio_2_tri_o_15),
        .IO(fmc2_gpio_2_tri_io[15]),
        .O(fmc2_gpio_2_tri_i_15),
        .T(fmc2_gpio_2_tri_t_15));
  IOBUF fmc2_gpio_2_tri_iobuf_16
       (.I(fmc2_gpio_2_tri_o_16),
        .IO(fmc2_gpio_2_tri_io[16]),
        .O(fmc2_gpio_2_tri_i_16),
        .T(fmc2_gpio_2_tri_t_16));
  IOBUF fmc2_gpio_2_tri_iobuf_17
       (.I(fmc2_gpio_2_tri_o_17),
        .IO(fmc2_gpio_2_tri_io[17]),
        .O(fmc2_gpio_2_tri_i_17),
        .T(fmc2_gpio_2_tri_t_17));
  IOBUF fmc2_gpio_2_tri_iobuf_18
       (.I(fmc2_gpio_2_tri_o_18),
        .IO(fmc2_gpio_2_tri_io[18]),
        .O(fmc2_gpio_2_tri_i_18),
        .T(fmc2_gpio_2_tri_t_18));
  IOBUF fmc2_gpio_2_tri_iobuf_19
       (.I(fmc2_gpio_2_tri_o_19),
        .IO(fmc2_gpio_2_tri_io[19]),
        .O(fmc2_gpio_2_tri_i_19),
        .T(fmc2_gpio_2_tri_t_19));
  IOBUF fmc2_gpio_2_tri_iobuf_2
       (.I(fmc2_gpio_2_tri_o_2),
        .IO(fmc2_gpio_2_tri_io[2]),
        .O(fmc2_gpio_2_tri_i_2),
        .T(fmc2_gpio_2_tri_t_2));
  IOBUF fmc2_gpio_2_tri_iobuf_3
       (.I(fmc2_gpio_2_tri_o_3),
        .IO(fmc2_gpio_2_tri_io[3]),
        .O(fmc2_gpio_2_tri_i_3),
        .T(fmc2_gpio_2_tri_t_3));
  IOBUF fmc2_gpio_2_tri_iobuf_4
       (.I(fmc2_gpio_2_tri_o_4),
        .IO(fmc2_gpio_2_tri_io[4]),
        .O(fmc2_gpio_2_tri_i_4),
        .T(fmc2_gpio_2_tri_t_4));
  IOBUF fmc2_gpio_2_tri_iobuf_5
       (.I(fmc2_gpio_2_tri_o_5),
        .IO(fmc2_gpio_2_tri_io[5]),
        .O(fmc2_gpio_2_tri_i_5),
        .T(fmc2_gpio_2_tri_t_5));
  IOBUF fmc2_gpio_2_tri_iobuf_6
       (.I(fmc2_gpio_2_tri_o_6),
        .IO(fmc2_gpio_2_tri_io[6]),
        .O(fmc2_gpio_2_tri_i_6),
        .T(fmc2_gpio_2_tri_t_6));
  IOBUF fmc2_gpio_2_tri_iobuf_7
       (.I(fmc2_gpio_2_tri_o_7),
        .IO(fmc2_gpio_2_tri_io[7]),
        .O(fmc2_gpio_2_tri_i_7),
        .T(fmc2_gpio_2_tri_t_7));
  IOBUF fmc2_gpio_2_tri_iobuf_8
       (.I(fmc2_gpio_2_tri_o_8),
        .IO(fmc2_gpio_2_tri_io[8]),
        .O(fmc2_gpio_2_tri_i_8),
        .T(fmc2_gpio_2_tri_t_8));
  IOBUF fmc2_gpio_2_tri_iobuf_9
       (.I(fmc2_gpio_2_tri_o_9),
        .IO(fmc2_gpio_2_tri_io[9]),
        .O(fmc2_gpio_2_tri_i_9),
        .T(fmc2_gpio_2_tri_t_9));
  IOBUF gem_3_mdio_mdio_iobuf
       (.I(gem_3_mdio_mdio_o),
        .IO(gem_3_mdio_mdio_io),
        .O(gem_3_mdio_mdio_i),
        .T(gem_3_mdio_mdio_t));
  IOBUF pmod_gpio_1_tri_iobuf_0
       (.I(pmod_gpio_1_tri_o_0),
        .IO(pmod_gpio_1_tri_io[0]),
        .O(pmod_gpio_1_tri_i_0),
        .T(pmod_gpio_1_tri_t_0));
  IOBUF pmod_gpio_1_tri_iobuf_1
       (.I(pmod_gpio_1_tri_o_1),
        .IO(pmod_gpio_1_tri_io[1]),
        .O(pmod_gpio_1_tri_i_1),
        .T(pmod_gpio_1_tri_t_1));
  IOBUF pmod_gpio_1_tri_iobuf_2
       (.I(pmod_gpio_1_tri_o_2),
        .IO(pmod_gpio_1_tri_io[2]),
        .O(pmod_gpio_1_tri_i_2),
        .T(pmod_gpio_1_tri_t_2));
  IOBUF pmod_gpio_1_tri_iobuf_3
       (.I(pmod_gpio_1_tri_o_3),
        .IO(pmod_gpio_1_tri_io[3]),
        .O(pmod_gpio_1_tri_i_3),
        .T(pmod_gpio_1_tri_t_3));
  IOBUF pmod_gpio_1_tri_iobuf_4
       (.I(pmod_gpio_1_tri_o_4),
        .IO(pmod_gpio_1_tri_io[4]),
        .O(pmod_gpio_1_tri_i_4),
        .T(pmod_gpio_1_tri_t_4));
  IOBUF pmod_gpio_1_tri_iobuf_5
       (.I(pmod_gpio_1_tri_o_5),
        .IO(pmod_gpio_1_tri_io[5]),
        .O(pmod_gpio_1_tri_i_5),
        .T(pmod_gpio_1_tri_t_5));
  IOBUF pmod_gpio_1_tri_iobuf_6
       (.I(pmod_gpio_1_tri_o_6),
        .IO(pmod_gpio_1_tri_io[6]),
        .O(pmod_gpio_1_tri_i_6),
        .T(pmod_gpio_1_tri_t_6));
  IOBUF pmod_gpio_1_tri_iobuf_7
       (.I(pmod_gpio_1_tri_o_7),
        .IO(pmod_gpio_1_tri_io[7]),
        .O(pmod_gpio_1_tri_i_7),
        .T(pmod_gpio_1_tri_t_7));
  IOBUF pmod_gpio_2_tri_iobuf_0
       (.I(pmod_gpio_2_tri_o_0),
        .IO(pmod_gpio_2_tri_io[0]),
        .O(pmod_gpio_2_tri_i_0),
        .T(pmod_gpio_2_tri_t_0));
  IOBUF pmod_gpio_2_tri_iobuf_1
       (.I(pmod_gpio_2_tri_o_1),
        .IO(pmod_gpio_2_tri_io[1]),
        .O(pmod_gpio_2_tri_i_1),
        .T(pmod_gpio_2_tri_t_1));
  IOBUF pmod_gpio_2_tri_iobuf_2
       (.I(pmod_gpio_2_tri_o_2),
        .IO(pmod_gpio_2_tri_io[2]),
        .O(pmod_gpio_2_tri_i_2),
        .T(pmod_gpio_2_tri_t_2));
  IOBUF pmod_gpio_2_tri_iobuf_3
       (.I(pmod_gpio_2_tri_o_3),
        .IO(pmod_gpio_2_tri_io[3]),
        .O(pmod_gpio_2_tri_i_3),
        .T(pmod_gpio_2_tri_t_3));
  IOBUF pmod_gpio_2_tri_iobuf_4
       (.I(pmod_gpio_2_tri_o_4),
        .IO(pmod_gpio_2_tri_io[4]),
        .O(pmod_gpio_2_tri_i_4),
        .T(pmod_gpio_2_tri_t_4));
  IOBUF pmod_gpio_2_tri_iobuf_5
       (.I(pmod_gpio_2_tri_o_5),
        .IO(pmod_gpio_2_tri_io[5]),
        .O(pmod_gpio_2_tri_i_5),
        .T(pmod_gpio_2_tri_t_5));
  IOBUF pmod_gpio_2_tri_iobuf_6
       (.I(pmod_gpio_2_tri_o_6),
        .IO(pmod_gpio_2_tri_io[6]),
        .O(pmod_gpio_2_tri_i_6),
        .T(pmod_gpio_2_tri_t_6));
  IOBUF pmod_gpio_2_tri_iobuf_7
       (.I(pmod_gpio_2_tri_o_7),
        .IO(pmod_gpio_2_tri_io[7]),
        .O(pmod_gpio_2_tri_i_7),
        .T(pmod_gpio_2_tri_t_7));
endmodule
