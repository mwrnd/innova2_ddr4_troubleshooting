![CAL FAIL Write Leveling](img/DDR4_PG150_DDR_CAL_ERROR_1.png)

# Innova-2 XCKU15P FPGA DDR4 Troubleshooting

![DDR4 Memory ICs](img/DDR4_ICs.png)

## DDR4 Communication Error

If you attempt to send data to the DDR4 address but get `write file: Unknown error 512` it likely means DDR4 did not initialize properly. Start by performing a cold reboot and checking communication again. The [innova2_xcku15p_ddr4_bram_gpio](https://github.com/mwrnd/innova2_xcku15p_ddr4_bram_gpio) project and all troubleshooting bitstreams have DDR4 at address `0x0` but if you made any changes to the design confirm in the *Vivado Block Design Address Editor* that it is still `0x0`.

![Confirm Address is Correct](img/Address_Map_Layout.png)

If [BRAM and GPIO communication](https://github.com/mwrnd/innova2_xcku15p_ddr4_bram_gpio#axi-bram-communication) succeed but DDR4 fails then the issue is with DDR4.
```Shell
cd ~/dma_ip_drivers/XDMA/linux-kernel/tools/
dd if=/dev/urandom bs=1 count=8192 of=TEST
sudo ./dma_to_device   --verbose --device /dev/xdma0_h2c_0 --address 0x0 --size 8192  -f    TEST
```

![Error 512](img/XDMA_DDR4_Communication_Failure_Error_512.png)

A copy of [Xilinx's PG150 Memory IP Guide](https://www.xilinx.com/support/documentation/ip_documentation/ultrascale_memory_ip/v1_4/pg150-ultrascale-memory-ip.pdf) is useful to have.

### Load the ddr4_0_ex Bitstream and Connect JTAG

[ddr4_0_ex](#recreating-ddr4_0_ex-example-design) is Xilinx's Example Design for DDR4. It includes an Integrated Logic Analyzer (ILA) and access to calibration details.

Refer to the `innova2_flex_xcku15p_notes` project's instructions on [Loading a User Image](https://github.com/mwrnd/innova2_flex_xcku15p_notes/#loading-a-user-image) and load the [included](ddr4_0_ex) `innova2_ddr4_0_ex` bitstream onto the Innova-2's Configuration Memory.

```Shell
cd ddr4_0_ex
md5sum *bin
echo 17875fbea8e5e3426092b44884dbf717 should be md5sum of innova2_ddr4_0_ex_primary.bin
echo e182409813ddd130f50b2faa3257a5bb should be md5sum of innova2_ddr4_0_ex_secondary.bin
```

Connect your [Xilinx-Compatible](https://docs.xilinx.com/v/u/en-US/ds593) **1.8V** [JTAG Adapter](https://www.waveshare.com/platform-cable-usb.htm) to view DDR4 calibration status.

Start *Vivado* or *Vivado Lab Edition* Hardware Manager.

![Open Vivado Hardware Manager](img/Vivado_Hardware_Manager.png)

Open Target and Auto Connect.

![Open Target and Auto Connect](img/Hardware_Manager_AutoConnect.png)

Click on *MIG_1* to view DDR4 calibration status.

![DDR4 JTAG CAL FAIL](img/DDR4_CAL_Fail_Write_Leveling.png)

I encountered a *Write Leveling* failure. For other types of failures, continue by enabling the ILA. Continue to [Xilinx's DDR4 Issues Page](https://support.xilinx.com/s/article/69035?language=en_US) and the [Xilinx DDR4 Design Hub](https://www.xilinx.com/support/documentation-navigation/design-hubs/dh0061-ultrascale-memory-interface-ddr4-ddr3-hub.html).

If calibration finishes successfully you will something like the following:

![DDR4 JTAG CAL PASS](img/DDR4_JTAG_Debug_CAL_PASS_ddr4_0_ex.png)

Click on *Specify Debug Probes* in the *Trigger Setup* window.

![ILA Specify Debug Probes](img/DDR4_ILA_Specify_Debug_Probes_ltx.png)

Select the included [debug_nets.ltx](ddr4_0_ex/debug_nets.ltx).

![Select debug_nets.ltx](DDR4_ILA_Select_Debug_Probes_ltx.png)

Select the *Run Trigger* button to re-start the DDR4 calibration sequence and capture critical signal waveforms.

![hw_ila_1 Run Trigger](img/hw_ila_1_Run_Trigger_and_View_Waveforms.png)


### CAL FAIL Write Leveling

Write Leveling calibrates clock to Data Strobe (DQS) signal timings. DDR4 uses a fly-by wiring topology for control and address signals but point-to-point for Data Strobe (DQS), Data Mask (DM), and Data Byte Lanes (DQ). It is worthwhile to test individual byte lanes on a Write Leveling error as it is unlikely every memory IC is broken. Some of the memory address space may still be usable.

There are five [MT40A1G16KNR-075 ICs](https://www.micron.com/products/dram/ddr4-sdram/part-catalog/mt40a1g16knr-075) with **D9WFR** [FBGA Code](https://www.micron.com/support/tools-and-utilities/fbga?fbga=D9WFR#pnlFBGA) on the board which each have two x8 dies. The full memory interface is 72-Bit (64-Bit + ECC) so only 9 of the 10 dies are used.

![DDR4 Overview](img/DDR4_Overview.png)

The Xilinx DDR4 IP only allows 8, 16, 32, 64, and 72 bit (64-bit with ECC) wide DDR4 interfaces. Therefore you can have 1GB, 2GB, 4GB, 8GB, or 8GB with ECC of memory space. Bank 66 is the main Address/Control/Byte-Lane-0 bank while Bank 67 is for Byte Lanes 3, 4, 5, and 6. Bank 68 is for Byte Lanes 1, 2, 7, and 8.

![DDR4 Banks](img/DDR4_Full_72Bit_Byte-Lanes.png)





I first tested a slower version of the DDR4 memory interface, DDR4-1400 which runs at 700MHz. I also got a Write Leveling Calibration error.




![DDR4-1400](img/DDR4-1400_MT40A1G16WBU-083E_Basic_Configuration.png)

I also connected *ddr4_ui_clk* to the divide-by-2^27 counter to blink the D18 LED if the DDR4 block is active.

![ddr4_ui_clk connect to counter](img/DDR4-1400_MT40A1G16WBU-083E_Counter_to_ddr4_ui_clk.png)

I then tested an 8-Bit wide version, [innova2_constraints_ddr4_8bit_byte-lane-0.xdc](innova2_constraints_ddr4_8bit_byte-lane-0.xdc), that uses only Byte Lane 0. It worked! My board has at least 1GB of working DDR4.

![DDR4-1400 8Bit Byte Lane 0 Works](img/DDR4-1400_8Bit_Working_ByteLane.png)

I then tested 8-Bit wide versions of the DDR4 interface using different Byte Lanes from Bank 67. Each 8-Bit interface using Byte Lanes from Bank 67 worked!

I then tested a 32-Bit wide version of the DDR4 interface using [all four Byte Lanes from Bank 67](https://github.com/mwrnd/innova2_flex_xcku15p_notes/blob/a80d521a60757b3b8c5ceabf8a41422d13a8c0a1/Troubleshooting/innova2_constraints_ddr4_32bit_byte-lanes-3-4-5-6-Bank67.xdc#L138). It worked! At least 4GB of DDR4 is usable.

I then tested 16-Bit wide versions of the DDR4 interface using different Byte Lanes from Bank 67 and Bank 68. Banks used must be contiguous. You cannot skip Bank 67 and use Banks 66 and 68. Bank 67 must be used for Bank 68 Byte Lanes to be tested so I used the known-working Byte Lane 3 from Bank 67 to test Bank 68 lanes. Byte Lanes [1+3](innova2_constraints_ddr4_16bit_byte-lanes-1-3.xdc) failed but Byte Lanes [2+3](innova2_constraints_ddr4_16bit_byte-lanes-2-3.xdc) worked! Byte Lane 1 is broken.

![DDR4-1400 16Bit Byte Lanes 1 and 3 Fail](img/DDR4-1400_16Bit_ByteLanes-1-3.png)

I then tested [3+7](innova2_constraints_ddr4_16bit_byte-lanes-3-7.xdc) and [3+8](innova2_constraints_ddr4_16bit_byte-lanes-3-8.xdc) and both worked. Only Byte Lane 1 is broken. Bank 68 otherwise works.

I then tested 64-Bit versions of the DDR4 memory interface without Byte Lane 1 at two speeds, DDR4-1400 (**1428**ps) and DDR4-2400 (**833**ps). Both worked! Since I do not have access to a schematic I cannot further investigate this Byte Lane issue. However, I do not need ECC so having the full 8GB of working RAM is good enough.

![DDR4-2400 64Bit No ECC No Byte Lane 1 DMA Throughput](img/DDR4-2400_64Bit_NoByteLane1_DMA_Throughput.png)


## Recreating ddr4_0_ex Example Design

The included [ddr4_0_ex_example_design.xdc](ddr4_0_ex/ddr4_0_ex_example_design.xdc) constraints file has the correct pin mappings when creating the DDR4 Example Design using **Vivado 2021.2**.

Begin by `source`ing the [innova2_xcku15p_ddr4_bram_gpio](https://github.com/mwrnd/innova2_xcku15p_ddr4_bram_gpio#recreating-the-design-in-vivado) project and editing the DDR4 options to slower memory speeds (**1428**ps) and the built-in IC configuration (**MT40A1G16WBU-083E**). Set *CAS Latency* to the highest value.

![DDR4 Basic Options](img/DDR4-1400_MT40A1G16WBU-083E_Basic_Configuration.png)

Select the option to enable Debug Signals under Advanced Options in the DDR4 IP Customizer.

![Enable Debug Signals](img/ddr4_0_ex_Enable_Debug_Signals.png)

Right-click on the DDR4 Block and choose *Open IP Example Design*.

![Open IP Example Design](img/Vivado_Open_IP_Example_Design.png)

After Vivado generates the Example Design, confirm the *Integrated Logic Analyzer (ILA)* is present in the design.

![Confirm ILA is present](img/Confirm_ILA_Is_Present.png)

Update the Constraints File *example_design.xdc* with the contents of the included [ddr4_0_ex_example_design.xdc](ddr4_0_ex_example_design.xdc) file. Also, the `sys_rst` signal must be inverted in *example_top.sv*.

![Invert sys_rst](img/ddr4_0_ex_Inverted_PCIe_Reset_for_sys_rst.png)



