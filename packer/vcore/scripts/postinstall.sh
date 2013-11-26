# postinstall.sh

# Some preparation
mkdir -p bin && chown tc bin && chgrp staff bin
date > /opt/vagrant_box_build_time
/bin/ln -s /home/tc/bin/shutdown /sbin/shutdown

# bootsync: Adding lines to /opt/bootsync.sh
sed -i s/sethostname box/sethostname vcore/g /opt/bootsync.sh
sh -c "cat >> /opt/bootsync.sh" << EOF
/bin/mkdir -p /vagrant
/bin/chown -R tc:staff /vagrant
/bin/chmod -R 777 /vagrant
EOF
touch ./bootsync
cat bootsync >> /opt/bootsync.sh
rm ./bootsync
sh -c "cat >> /opt/bootsync.sh" << EOF
/usr/local/etc/init.d/openssh start
/sbin/depmod -a
/bin/ln -s /home/tc/bin/shutdown /sbin/shutdown
EOF

# filetool: Adding lines to /opt/.filetool.lst
cat >> /opt/.filetool.lst << EOF
/usr/local/etc/ssh
/usr/local/etc/ssh
EOF
touch ./filetool
cat filetool >> /opt/.filetool.lst
rm ./filetool

# xfiletool: Adding lines to /opt/.xfiletool.lst
touch ./xfiletool
cat xfiletool >> /opt/.xfiletool.lst
rm ./xfiletool

# onboot: Adding packages to (tce)/onboot.lst
touch ./onboot
cat onboot >> /mnt/sda1/tce/onboot.lst
rm ./onboot

# shutdown: Placing a power off script
mkdir -p ./bin
chown tc:staff ./bin ./shutdown
chmod 755 ./shutdown
mv ./shutdown ./bin/
ln -s /home/tc/bin/shutdown /sbin/shutdown

# Setup sudo to allow no-password sudo for "admin"
#groupadd -r admin
#usermod -a -G admin vagrant
#cp /etc/sudoers /etc/sudoers.orig
#sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
#sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers

# Fix home dir permission
chmod 0700 /home/tc
chown tc:staff /home/tc

# sshd Setup. Installing vagrant keys
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

sed -i 's/#GSSAPIAuthentication no/GSSAPIAuthentication no/g' $SSHCFG
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

cat << EOF >> /home/tc/.ashrc
# Restart DHCP client
dhcp_reset() {
sudo pkill udhcpc
sleep 0.5
sudo udhcpc -b -i eth0 -p /var/run/udhcpc.eth0.pid
}
# generic shortcut
alias c='clear'
alias cd..='cd ..'
alias sl=ls
alias exit=exiy
alias reboot='sudo reboot'
alias psg='ps -elf | grep -v $$ | grep -i -e WCHAN -e '
# system info
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias cpuinfo='/bin/cat /proc/cpuinfo|/bin/grep -E "processor|model name|cache size|core|sibling|physical"'
# network info
alias fastping='ping -c 100 -s.2'
alias ports='netstat -tulanp'
# Tiny Core short cut
alias fsync='sudo filetool.sh -b'

EOF

# Colorful prompt
sed -i -e "s/^PS1=.*/PS1='\\\\e[1;32m\\\\u@\\\\h\\\\e[0m:\\\\e[1;34m\\\\w\\\\e[0m\\\\$ '/" .profile
sed -i -e "s/^PS1=.*/PS1='\\\\e[1;32m\\\\u@\\\\h\\\\e[0m:\\\\e[1;34m\\\\w\\\\e[0m\\\\$ '/" /etc/skel/.profile

