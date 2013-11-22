# ram.10.sh

# open core.gz

# Changing encoding
mkdir ~/core;cd ~/core

gzip -dc /mnt/sda1/boot/core.gz | sudo cpio -i

cd ~
