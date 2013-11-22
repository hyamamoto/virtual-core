# cleanupfsync.sh

# Cleaning up
rm -f /home/tc/.veewee_params
rm -f /home/tc/.veewee_version
rm -f /home/tc/postinstall.sh
cat /dev/null > /home/tc/.ash_history

# File sync
filetool.sh -b

# Zero-fill. May take minutes to complete
sudo dd if=/dev/zero of=/mnt/sda1/bigemptyfile
sudo rm -rf /mnt/sda1/bigemptyfile

# bye bye magic
sync;sleep 1;sync;exit 0
