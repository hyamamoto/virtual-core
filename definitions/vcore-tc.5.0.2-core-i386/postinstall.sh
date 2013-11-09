# postinstall.sh

VBOX_VERSION=$(cat /home/tc/.vbox_version)
MODULES_DIR=/lib/modules/3.8.10-tinycore/misc

mkdir -p bin && chown tc bin && chgrp staff bin
date > /opt/vagrant_box_build_time
/bin/ln -s /home/tc/bin/shutdown /sbin/shutdown

# Virtualbox additions
rm -f ./base64
mkdir -p $MODULES_DIR
tar xvfz vbox-ga.tar.gz
chown root:root *.ko; chmod 644 *.ko
mv ./vboxguest.ko ./vboxsf.ko ./vboxvideo.ko $MODULES_DIR
mv ./mount.vboxsf bin/
rm -f ./vbox-ga.tar.gz

# Setup sudo to allow no-password sudo for "admin"
#groupadd -r admin
#usermod -a -G admin vagrant
#cp /etc/sudoers /etc/sudoers.orig
#sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
#sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers

# Installing vagrant keys
mkdir -p /home/tc/.ssh
chmod 700 /home/tc/.ssh
cat /mnt/sda1/tce/vagrant_keys >> /home/tc/.ssh/authorized_keys
rm /mnt/sda1/tce/vagrant_keys
chmod 600 /home/tc/.ssh/authorized_keys
chown -R tc:staff /home/tc/.ssh

# Hints for Dev
#tce-load -iw compiletc
#tce-load -iw advcomp
#tce-load -iw mkisofs-tools
#tce-load -iw linux-3.8.10-sources-env
#/usr/local/bin/linux-3.8.10-sources-env.sh

# Cleaning up
rm -f VBoxGuestAdditions_$VBOX_VERSION.iso
rm -f /home/tc/.veewee_params
rm -f /home/tc/.veewee_version
rm -f /home/tc/vbox-ga_tar_gz.sh
rm -f /home/tc/postinstall.sh
cat /dev/null > /home/tc/.ash_history

filetool.sh -b
exit 0
