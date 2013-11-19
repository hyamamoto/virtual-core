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

# Fix home dir permission
chmod 0700 /home/tc
chown tc:staff /home/tc

# Installing vagrant keys
mkdir -p /home/tc/.ssh
chmod 0700 /home/tc/.ssh
cat /mnt/sda1/tce/vagrant_keys >> /home/tc/.ssh/authorized_keys
rm /mnt/sda1/tce/vagrant_keys
chmod 0600 /home/tc/.ssh/authorized_keys
chown -R tc:staff /home/tc/.ssh
chmod g-rsx,o-rx /home/tc/.ssh
SSHCFG=/usr/local/etc/ssh/sshd_config
sed -i 's/#Port 22/Port 22/g' $SSHCFG
sed -i 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/g' $SSHCFG
sed -i 's/#ListenAddress ::/ListenAddress ::/g' $SSHCFG
sed -i 's/#Protocol 2/Protocol 2/g' $SSHCFG
sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' $SSHCFG
sed -i 's/#UseDNS yes/UseDNS no/g' $SSHCFG
sed -i 's/#PermitTunnel no/PermitTunnel no/g' $SSHCFG
sed -i 's/#PermitTunnel no/PermitTunnel no/g' $SSHCFG
sed -i 's/#       X11Forwarding no/X11Forwarding no/g' $SSHCFG
sed -i 's/#       AllowTcpForwarding no/AllowTcpForwarding no/g' $SSHCFG
sed -i 's/#AllowAgentForwarding yes/AllowAgentForwarding yes/g' $SSHCFG
sed -i 's/#AllowTcpForwarding yes/AllowTcpForwarding yes/g' $SSHCFG
sed -i 's/#GatewayPorts no/GatewayPorts no/g' $SSHCFG
sed -i 's/#X11Forwarding no/X11Forwarding no/g' $SSHCFG
sed -i 's/#X11UseLocalhost yes/X11UseLocalhost yes/g' $SSHCFG
sed -i 's/#PrintMotd yes/PrintMotd yes/g' $SSHCFG
sed -i 's/#PrintLastLog yes/PrintLastLog yes/g' $SSHCFG
sed -i 's/#TCPKeepAlive yes/TCPKeepAlive yes/g' $SSHCFG
sed -i 's/#PermitUserEnvironment no/PermitUserEnvironment yes/g' $SSHCFG
sed -i -e 's/#.*//' -e '/^$/ d' $SSHCFG

cat >> /home/tc/.ash_history
alias pushd='DIRS="$PWD
$DIRS"; cd'
alias popd='LINE=`echo "\$DIRS" | sed -ne "1p"`;[ "$LINE" != "" ] && cd $LINE;DIRS=`echo "\$DIRS" | sed -e "1d"`'

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
