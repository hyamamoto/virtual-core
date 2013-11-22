# ram.30.sh

cd ~/core

# close core.gz
find . | sudo cpio -H newc -o | gzip -9 >../core.gz
cd ..; rm -rf core
tce-load -iw advcomp
advdef -z4 core.gz
dd if=/dev/zero bs=1M count=10 of=/mnt/sda1/boot/core.gz
rm /mnt/sda1/boot/core.gz
cp core.gz /mnt/sda1/boot/core.gz

cd ~
