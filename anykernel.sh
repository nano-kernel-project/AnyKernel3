# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Nano kernel for Redmi 5
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=1
device.name1=rosy
device.name2=Redmi 5
supported.versions=7.1.2 - 9
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;

## AnyKernel install
dump_boot;

# begin ramdisk changes

# init.rc
insert_line init.rc "import /init.nano.rc" after "import /init.trace.rc" "import /init.nano.rc";

# sepolicy
$bin/magiskpolicy --load sepolicy --save sepolicy \
  "allow init rootfs file execute_no_trans" \
;

# end ramdisk changes

write_boot;

## end install
