# virtualbox.sh

VBOX_VERSION=$(cat /home/tc/.vbox_version)
MODULES_DIR=/lib/modules/$(uname -r)
MODULES_VMGA_DIR=$MODULES_DIR/vm-ga

# Install files from Virtualbox Guest Additions
mkdir -p $MODULES_VMGA_DIR
tar xvfz vbox-ga.tar.gz
chown root:root *.ko; chmod 644 *.ko
mv ./vboxguest.ko ./vboxsf.ko ./vboxvideo.ko $MODULES_VMGA_DIR
mkdir -p ./bin
mv ./mount.vboxsf /sbin/
rm -f ./vbox-ga.tar.gz

# temporary fix. this line will be deleted someday.
if [ -f ./base64 ]; then
  rm -f ./base64
fi

depmod -a

sudo sh -c "cat >> /opt/bootsync.sh" << EOF
/sbin/modprobe vboxguest
/sbin/modprobe vboxsf
EOF

# Cleaning up
rm -f VBoxGuestAdditions_$VBOX_VERSION.iso
rm -f /home/tc/vbox-ga_tar_gz.sh

