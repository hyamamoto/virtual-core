BTDIR=/mnt/sda1/boot

#Or, look at http://www.tinycorelinux.net/5.x/x86/release/distribution_files/
wget http://www.tinycorelinux.net/5.x/x86_64/release_candidates/distribution_files/rootfs64.gz
wget http://www.tinycorelinux.net/5.x/x86_64/release_candidates/distribution_files/modules64.gz
wget http://www.tinycorelinux.net/5.x/x86_64/release_candidates/distribution_files/vmlinuz64
 
# replace files 
rm $BTDIR/core.gz
rm $BTDIR/vmlinuz
mv rootfs64.gz $BTDIR/rootfs64.gz
mv modules64.gz $BTDIR/modules64.gz
mv vmlinuz64 $BTDIR/vmlinuz64
sed -i 's/Core Linux/Core Linux 64/g' $BTDIR/grub/grub.cfg
sed -i 's/vmlinuz/vmlinuz64/g' $BTDIR/grub/grub.cfg
sed -i 's/(hd0,1)\/boot\/core.gz/(hd0,1)\/boot\/rootfs64.gz (hd0,1)\/boot\/modules64.gz/g' $BTDIR/grub/grub.cfg

reboot
