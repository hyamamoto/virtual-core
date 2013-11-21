# virtualbox.sh

VBOX_VERSION=$(cat /home/tc/.vbox_version)

if [ `uname -m` = "x86_64" ]; then
  MODULES_DIR=/lib/modules/3.8.13-tinycore64/misc
else
  MODULES_DIR=/lib/modules/3.8.10-tinycore/misc
fi

# Install files from Virtualbox Guest Additions
mkdir -p $MODULES_DIR
tar xvfz vbox-ga.tar.gz
chown root:root *.ko; chmod 644 *.ko
mv ./vboxguest.ko ./vboxsf.ko ./vboxvideo.ko $MODULES_DIR
mkdir -p ./bin
mv ./mount.vboxsf ./bin/
rm -f ./vbox-ga.tar.gz
rm -f ./base64 # this line will be deleted someday.

sudo sh -c "cat >> /opt/bootsync.sh" << EOF
/sbin/modprobe vboxguest
/sbin/modprobe vboxsf
/bin/ln -s /home/tc/bin/mount.vboxsf /sbin/mount.vboxsf
EOF

# Cleaning up
rm -f VBoxGuestAdditions_$VBOX_VERSION.iso
rm -f /home/tc/vbox-ga_tar_gz.sh

