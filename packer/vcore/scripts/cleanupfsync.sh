# cleanupfsync.sh

# Clean .ash_history
cat /dev/null > /home/tc/.ash_history
if [ -f /home/tc/ash_history.base ];
then
  cat /home/tc/ash_history.base >> /home/tc/.ash_history
  rm /home/tc/ash_history.base
fi
if [ -f /home/tc/ash_history ];
then
  cat /home/tc/ash_history >> /home/tc/.ash_history
  rm /home/tc/ash_history
fi

# Cleaning up
rm -f /home/tc/.veewee_params
rm -f /home/tc/.veewee_version
rm -f VBoxGuestAdditions_*.iso
rm -f /home/tc/postinstall.sh

# File sync
filetool.sh -b

# Zero-fill. May take minutes to complete
sudo dd if=/dev/zero of=/mnt/sda1/bigemptyfile
sudo rm -rf /mnt/sda1/bigemptyfile

# bye bye magic
sync;sleep 1;sync;exit 0
