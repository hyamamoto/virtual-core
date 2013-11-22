# ram.20.sh

cd ~/core

# Changing encoding
sudo sed -i 's/OPTIONS="$OPTIONS"/OPTIONS="$OPTIONS,locale=ja_JP.utf8"/g' usr/sbin/rebuildfstab
sudo sed -i 's/OPTIONS="$OPTIONS,ro,umask=000"/OPTIONS="$OPTIONS,ro,umask=000,iocharset=utf8"/g' usr/sbin/rebuildfstab
sudo sed -i 's#\(msdos\|fat\))#\0 grep -qi "lang=[^ ]*utf8" /proc/cmdline \&\& OPTIONS="${OPTIONS},codepage=932,iocharset=utf8"; #' usr/sbin/rebuildfstab

cd ~
