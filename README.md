# Xiaomi flourite stock kernel prebuilts

This directory contains the unmodified kernel boot artifacts and modules from
`flourite_global-ota_full-OS3.0.304.0.WPRMIXM-user-16.0-5339464250`.

| Artifact | Stock source | SHA-256 |
| --- | --- | --- |
| `Image` | `boot.img` | `97b2c53022e8c0bd0b279c4c592a196126a6eb0a93647c2957b39dcd5f2dc1c9` |
| `dtb/flourite-stock.dtb` | `vendor_boot.img` DTB section | `69b2adcfc14f6ae12442f09ad9963d0ab1b18e26d863b1ad17bae806383d654b` |
| `dtbo.img` | `dtbo` partition | `9b6e60b2a53c06f6285d17cd1380c60310dc4236fe304968a49a5bbdd59a83a0` |

The kernel reports `6.1.138-android14-11-g0c3d559bcd85-ab14529422`.  Its stock
modules must stay paired with this image: the currently published Xiaomi OSS
tree reports 6.1.68 and does not include all external Qualcomm/Xiaomi modules.

Some stock module filenames contain Qualcomm family names such as `cliffs` or
`pineapple`.  They are deliberately preserved; the actual device platform is
selected by the stock DTB and Android board configuration as `volcano`.

Set `FLOURITE_BUILD_KERNEL_FROM_SOURCE=true` to compile the published
`kernel/xiaomi/sm7635` tree instead.  That mode is intended for compile testing
until matching external modules are available; it is not yet a drop-in
replacement for these stock boot artifacts.
