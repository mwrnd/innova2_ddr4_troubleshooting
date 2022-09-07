# Innova-2 MNV303212A-ADIT and MNV303212A-ADAT Test

**Work in Progress**

Refer to the `innova2_flex_xcku15p_notes` project's instructions on [Loading a User Image](https://github.com/mwrnd/innova2_flex_xcku15p_notes/#loading-a-user-image) and load the included bitstream onto the Innova-2's FPGA Configuration Memory.

```
unzip innova2_ddr4_8bit_byte-lane-0_ADIT_MT40A512_bitstream.zip
echo a99d06c973d7bf5a7626bd56b664a193 should be MD5 Checksum of innova2_ddr4_8bit_byte-lane-0_ADIT_MT40A512_primary.bin
echo 0e688584b30f436bc48d296e00af3691 should be MD5 Checksum of innova2_ddr4_8bit_byte-lane-0_ADIT_MT40A512_secondary.bin
```


![DDR4 Memory ICs on MNV303212A-ADIT](../img/MNV303212A-ADIT_has_D9TBK_DDR4.png)

![ADIT MT40A512M16LY ](img/adit_MT40A512M16LY-075_ddr4_8bit_DDR4_Addresses.png)

![ADIT MT40A512M16LY ](img/adit_MT40A512M16LY-075_ddr4_8bit_DDR4_Customization.png)

![ADIT MT40A512M16LY BRAM and GPIO Test](img/adit_MT40A512M16LY-075_ddr4_8bit_BRAM_and_GPIO_Tests.png)

![ADIT MT40A512M16LY Fails 512MB Transfer](img/adit_MT40A512M16LY-075_ddr4_8bit_Fails_512MB_Transfer.png)

![ADIT MT40A512M16LY Fails 1GB Transfer](img/adit_MT40A512M16LY-075_ddr4_8bit_Fails_1GB_Transfer.png)


