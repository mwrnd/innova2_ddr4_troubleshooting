
# Memory Configuration File Settings

set_property CONFIG_MODE SPIx8 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 127.5 [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 8 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.CONFIGFALLBACK DISABLE [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLUP [current_design]
set_property BITSTREAM.CONFIG.OVERTEMPSHUTDOWN ENABLE [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN DISABLE [current_design]
set_property BITSTREAM.GENERAL.CRC ENABLE [current_design]
set_property BITSTREAM.CONFIG.NEXT_CONFIG_REBOOT DISABLE [current_design]



# LEDs - A6=D19, B6=D18 - Inverted: 0=on, 1=off

set_property PACKAGE_PIN A6 [get_ports {gpio_rtl_0_tri_o[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_0_tri_o[0]}]
set_property OFFCHIP_TERM NONE [get_ports {gpio_rtl_0_tri_o[0]}]

set_property PACKAGE_PIN B6 [get_ports {Dout_0[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Dout_0[0]}]
set_property OFFCHIP_TERM NONE [get_ports {Dout_0[0]}]



# PCIe

set_property PACKAGE_PIN AA38 [get_ports {pcie_7x_mgt_rtl_0_rxp[7]}]
set_property PACKAGE_PIN AB36 [get_ports {pcie_7x_mgt_rtl_0_rxp[6]}]
set_property PACKAGE_PIN AC38 [get_ports {pcie_7x_mgt_rtl_0_rxp[5]}]
set_property PACKAGE_PIN AD36 [get_ports {pcie_7x_mgt_rtl_0_rxp[4]}]
set_property PACKAGE_PIN AE38 [get_ports {pcie_7x_mgt_rtl_0_rxp[3]}]
set_property PACKAGE_PIN AF36 [get_ports {pcie_7x_mgt_rtl_0_rxp[2]}]
set_property PACKAGE_PIN AG38 [get_ports {pcie_7x_mgt_rtl_0_rxp[1]}]
set_property PACKAGE_PIN AH36 [get_ports {pcie_7x_mgt_rtl_0_rxp[0]}]

set_property PACKAGE_PIN AB27 [get_ports {diff_clock_rtl_0_clk_p[0]}]
create_clock -name sys_clk -period 10.000 [get_ports diff_clock_rtl_0_clk_p]

# PCIe Reset - Active High
set_property PACKAGE_PIN F2 [get_ports reset_rtl_0]
set_property IOSTANDARD LVCMOS33 [get_ports reset_rtl_0]



# DDR4

# DDR4 Clock and Control Pins - Bank 66
set_property PACKAGE_PIN AP24 [get_ports diff_clock_rtl_1_clk_p]
set_property PACKAGE_PIN AR24 [get_ports ddr4_rtl_0_reset_n]
set_property PACKAGE_PIN AM25 [get_ports ddr4_rtl_0_act_n]
set_property PACKAGE_PIN AW26 [get_ports {ddr4_rtl_0_cke[0]}]
set_property PACKAGE_PIN AW24 [get_ports {ddr4_rtl_0_cs_n[0]}]
set_property PACKAGE_PIN AV27 [get_ports {ddr4_rtl_0_odt[0]}]
set_property PACKAGE_PIN AU25 [get_ports {ddr4_rtl_0_ck_t[0]}]
set_property PACKAGE_PIN AV25 [get_ports {ddr4_rtl_0_ck_c[0]}]
set_property PACKAGE_PIN AT24 [get_ports {ddr4_rtl_0_ba[0]}]
set_property PACKAGE_PIN AU23 [get_ports {ddr4_rtl_0_ba[1]}]
set_property PACKAGE_PIN AV23 [get_ports {ddr4_rtl_0_bg[0]}]
set_property PACKAGE_PIN AT27 [get_ports {ddr4_rtl_0_bg[1]}]

# DDR4 Address Pins - Bank 66
set_property PACKAGE_PIN AN23 [get_ports {ddr4_rtl_0_adr[0]}]
set_property PACKAGE_PIN AM24 [get_ports {ddr4_rtl_0_adr[1]}]
set_property PACKAGE_PIN AK22 [get_ports {ddr4_rtl_0_adr[2]}]
set_property PACKAGE_PIN AU24 [get_ports {ddr4_rtl_0_adr[3]}]
set_property PACKAGE_PIN AR26 [get_ports {ddr4_rtl_0_adr[4]}]
set_property PACKAGE_PIN AM23 [get_ports {ddr4_rtl_0_adr[5]}]
set_property PACKAGE_PIN AP26 [get_ports {ddr4_rtl_0_adr[6]}]
set_property PACKAGE_PIN AT26 [get_ports {ddr4_rtl_0_adr[7]}]
set_property PACKAGE_PIN AN25 [get_ports {ddr4_rtl_0_adr[8]}]
set_property PACKAGE_PIN AP23 [get_ports {ddr4_rtl_0_adr[9]}]
set_property PACKAGE_PIN AW23 [get_ports {ddr4_rtl_0_adr[10]}]
set_property PACKAGE_PIN AJ24 [get_ports {ddr4_rtl_0_adr[11]}]
set_property PACKAGE_PIN AT25 [get_ports {ddr4_rtl_0_adr[12]}]
set_property PACKAGE_PIN AL24 [get_ports {ddr4_rtl_0_adr[13]}]
set_property PACKAGE_PIN AW25 [get_ports {ddr4_rtl_0_adr[14]}]
set_property PACKAGE_PIN AR27 [get_ports {ddr4_rtl_0_adr[15]}]
set_property PACKAGE_PIN AV26 [get_ports {ddr4_rtl_0_adr[16]}]



# DDR4 Data, Data Strobe, and Mask - Byte Lanes
# Bank 66 - Byte Lane  0
# Bank 67 - Byte Lanes 3, 4, 5, 6
# Bank 68 - Byte Lanes 1, 2, 7, 8

# Byte Lane 0 - Bank 66
# set_property PACKAGE_PIN AH26 [get_ports {ddr4_rtl_0_dqs_t[0]}]
# set_property PACKAGE_PIN AH27 [get_ports {ddr4_rtl_0_dqs_c[0]}]
# set_property PACKAGE_PIN AL25 [get_ports {ddr4_rtl_0_dm_n[0]}]

# set_property PACKAGE_PIN AJ26 [get_ports {ddr4_rtl_0_dq[0]}]
# set_property PACKAGE_PIN AK28 [get_ports {ddr4_rtl_0_dq[1]}]
# set_property PACKAGE_PIN AJ28 [get_ports {ddr4_rtl_0_dq[2]}]
# set_property PACKAGE_PIN AK27 [get_ports {ddr4_rtl_0_dq[3]}]
# set_property PACKAGE_PIN AN27 [get_ports {ddr4_rtl_0_dq[4]}]
# set_property PACKAGE_PIN AN26 [get_ports {ddr4_rtl_0_dq[5]}]
# set_property PACKAGE_PIN AL27 [get_ports {ddr4_rtl_0_dq[6]}]
# set_property PACKAGE_PIN AK26 [get_ports {ddr4_rtl_0_dq[7]}]


# Byte Lane 1 - Bank 68
# set_property PACKAGE_PIN AK31 [get_ports {ddr4_rtl_0_dqs_t[1]}]
# set_property PACKAGE_PIN AL31 [get_ports {ddr4_rtl_0_dqs_c[1]}]
# set_property PACKAGE_PIN AH30 [get_ports {ddr4_rtl_0_dm_n[1]}]

# set_property PACKAGE_PIN AM33 [get_ports {ddr4_rtl_0_dq[8]}]
# set_property PACKAGE_PIN AK32 [get_ports {ddr4_rtl_0_dq[9]}]
# set_property PACKAGE_PIN AM32 [get_ports {ddr4_rtl_0_dq[10]}]
# set_property PACKAGE_PIN AJ30 [get_ports {ddr4_rtl_0_dq[11]}]
# set_property PACKAGE_PIN AH31 [get_ports {ddr4_rtl_0_dq[12]}]
# set_property PACKAGE_PIN AJ29 [get_ports {ddr4_rtl_0_dq[13]}]
# set_property PACKAGE_PIN AL32 [get_ports {ddr4_rtl_0_dq[14]}]
# set_property PACKAGE_PIN AH32 [get_ports {ddr4_rtl_0_dq[15]}]


# Byte Lane 2 - Bank 68
# set_property PACKAGE_PIN AN30 [get_ports {ddr4_rtl_0_dqs_t[2]}]
# set_property PACKAGE_PIN AN31 [get_ports {ddr4_rtl_0_dqs_c[2]}]
# set_property PACKAGE_PIN AM28 [get_ports {ddr4_rtl_0_dm_n[2]}]

# set_property PACKAGE_PIN AN33 [get_ports {ddr4_rtl_0_dq[16]}]
# set_property PACKAGE_PIN AN32 [get_ports {ddr4_rtl_0_dq[17]}]
# set_property PACKAGE_PIN AM30 [get_ports {ddr4_rtl_0_dq[18]}]
# set_property PACKAGE_PIN AP29 [get_ports {ddr4_rtl_0_dq[19]}]
# set_property PACKAGE_PIN AL29 [get_ports {ddr4_rtl_0_dq[20]}]
# set_property PACKAGE_PIN AP28 [get_ports {ddr4_rtl_0_dq[21]}]
# set_property PACKAGE_PIN AM29 [get_ports {ddr4_rtl_0_dq[22]}]
# set_property PACKAGE_PIN AL30 [get_ports {ddr4_rtl_0_dq[23]}]


# Byte Lane 3 - Bank 67 - For 8bit DDR4 Test, Use as Byte Lane 0
set_property PACKAGE_PIN AU38 [get_ports {ddr4_rtl_0_dqs_t[0]}]
set_property PACKAGE_PIN AV38 [get_ports {ddr4_rtl_0_dqs_c[0]}]
set_property PACKAGE_PIN AR37 [get_ports {ddr4_rtl_0_dm_n[0]}]

set_property PACKAGE_PIN AP38 [get_ports {ddr4_rtl_0_dq[0]}]
set_property PACKAGE_PIN AV37 [get_ports {ddr4_rtl_0_dq[1]}]
set_property PACKAGE_PIN AR39 [get_ports {ddr4_rtl_0_dq[2]}]
set_property PACKAGE_PIN AT39 [get_ports {ddr4_rtl_0_dq[3]}]
set_property PACKAGE_PIN AP39 [get_ports {ddr4_rtl_0_dq[4]}]
set_property PACKAGE_PIN AU37 [get_ports {ddr4_rtl_0_dq[5]}]
set_property PACKAGE_PIN AR38 [get_ports {ddr4_rtl_0_dq[6]}]
set_property PACKAGE_PIN AU39 [get_ports {ddr4_rtl_0_dq[7]}]


# Byte Lane 4 - Bank 67
# set_property PACKAGE_PIN AP34 [get_ports {ddr4_rtl_0_dqs_t[4]}]
# set_property PACKAGE_PIN AP35 [get_ports {ddr4_rtl_0_dqs_c[4]}]
# set_property PACKAGE_PIN AR34 [get_ports {ddr4_rtl_0_dm_n[4]}]

# set_property PACKAGE_PIN AR33 [get_ports {ddr4_rtl_0_dq[32]}]
# set_property PACKAGE_PIN AP36 [get_ports {ddr4_rtl_0_dq[33]}]
# set_property PACKAGE_PIN AT31 [get_ports {ddr4_rtl_0_dq[34]}]
# set_property PACKAGE_PIN AR31 [get_ports {ddr4_rtl_0_dq[35]}]
# set_property PACKAGE_PIN AT32 [get_ports {ddr4_rtl_0_dq[36]}]
# set_property PACKAGE_PIN AP33 [get_ports {ddr4_rtl_0_dq[37]}]
# set_property PACKAGE_PIN AR32 [get_ports {ddr4_rtl_0_dq[38]}]
# set_property PACKAGE_PIN AR36 [get_ports {ddr4_rtl_0_dq[39]}]


# Byte Lane 5 - Bank 67
# set_property PACKAGE_PIN AV32 [get_ports {ddr4_rtl_0_dqs_t[5]}]
# set_property PACKAGE_PIN AV33 [get_ports {ddr4_rtl_0_dqs_c[5]}]
# set_property PACKAGE_PIN AV35 [get_ports {ddr4_rtl_0_dm_n[5]}]

# set_property PACKAGE_PIN AU33 [get_ports {ddr4_rtl_0_dq[40]}]
# set_property PACKAGE_PIN AU35 [get_ports {ddr4_rtl_0_dq[41]}]
# set_property PACKAGE_PIN AU32 [get_ports {ddr4_rtl_0_dq[42]}]
# set_property PACKAGE_PIN AW34 [get_ports {ddr4_rtl_0_dq[43]}]
# set_property PACKAGE_PIN AT35 [get_ports {ddr4_rtl_0_dq[44]}]
# set_property PACKAGE_PIN AW35 [get_ports {ddr4_rtl_0_dq[45]}]
# set_property PACKAGE_PIN AU34 [get_ports {ddr4_rtl_0_dq[46]}]
# set_property PACKAGE_PIN AT36 [get_ports {ddr4_rtl_0_dq[47]}]


# Byte Lane 6 - Bank 67
# set_property PACKAGE_PIN AV30 [get_ports {ddr4_rtl_0_dqs_t[6]}]
# set_property PACKAGE_PIN AW30 [get_ports {ddr4_rtl_0_dqs_c[6]}]
# set_property PACKAGE_PIN AU28 [get_ports {ddr4_rtl_0_dm_n[6]}]

# set_property PACKAGE_PIN AW29 [get_ports {ddr4_rtl_0_dq[48]}]
# set_property PACKAGE_PIN AW31 [get_ports {ddr4_rtl_0_dq[49]}]
# set_property PACKAGE_PIN AV31 [get_ports {ddr4_rtl_0_dq[50]}]
# set_property PACKAGE_PIN AU29 [get_ports {ddr4_rtl_0_dq[51]}]
# set_property PACKAGE_PIN AU30 [get_ports {ddr4_rtl_0_dq[52]}]
# set_property PACKAGE_PIN AT29 [get_ports {ddr4_rtl_0_dq[53]}]
# set_property PACKAGE_PIN AW28 [get_ports {ddr4_rtl_0_dq[54]}]
# set_property PACKAGE_PIN AT30 [get_ports {ddr4_rtl_0_dq[55]}]


# Byte Lane 7 - Bank 68
# set_property PACKAGE_PIN AK37 [get_ports {ddr4_rtl_0_dqs_t[7]}]
# set_property PACKAGE_PIN AK38 [get_ports {ddr4_rtl_0_dqs_c[7]}]
# set_property PACKAGE_PIN AM37 [get_ports {ddr4_rtl_0_dm_n[7]}]

# set_property PACKAGE_PIN AM39 [get_ports {ddr4_rtl_0_dq[56]}]
# set_property PACKAGE_PIN AJ39 [get_ports {ddr4_rtl_0_dq[57]}]
# set_property PACKAGE_PIN AM38 [get_ports {ddr4_rtl_0_dq[58]}]
# set_property PACKAGE_PIN AL39 [get_ports {ddr4_rtl_0_dq[59]}]
# set_property PACKAGE_PIN AL36 [get_ports {ddr4_rtl_0_dq[60]}]
# set_property PACKAGE_PIN AK39 [get_ports {ddr4_rtl_0_dq[61]}]
# set_property PACKAGE_PIN AN38 [get_ports {ddr4_rtl_0_dq[62]}]
# set_property PACKAGE_PIN AL37 [get_ports {ddr4_rtl_0_dq[63]}]


# Byte Lane 8 - Bank 68
# set_property PACKAGE_PIN AN35 [get_ports {ddr4_rtl_0_dqs_t[8]}]
# set_property PACKAGE_PIN AN36 [get_ports {ddr4_rtl_0_dqs_c[8]}]
# set_property PACKAGE_PIN AK33 [get_ports {ddr4_rtl_0_dm_n[8]}]

# set_property PACKAGE_PIN AK35 [get_ports {ddr4_rtl_0_dq[64]}]
# set_property PACKAGE_PIN AM34 [get_ports {ddr4_rtl_0_dq[65]}]
# set_property PACKAGE_PIN AJ34 [get_ports {ddr4_rtl_0_dq[66]}]
# set_property PACKAGE_PIN AJ33 [get_ports {ddr4_rtl_0_dq[67]}]
# set_property PACKAGE_PIN AM35 [get_ports {ddr4_rtl_0_dq[68]}]
# set_property PACKAGE_PIN AL34 [get_ports {ddr4_rtl_0_dq[69]}]
# set_property PACKAGE_PIN AL35 [get_ports {ddr4_rtl_0_dq[70]}]
# set_property PACKAGE_PIN AH33 [get_ports {ddr4_rtl_0_dq[71]}]


