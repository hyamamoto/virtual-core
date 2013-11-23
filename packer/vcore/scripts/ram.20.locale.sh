# ram.20.sh

cd ~/core

LOCALE_ARCHIVE_FROM=/usr/lib/locale/locale-archive
LOCALE_ARCHIVE_TO=usr/lib/locale/locale-archive

if [ -f $LOCALE_ARCHIVE_FROM ];
then
  echo "Copying 'LOCALE_ARCHIVE_FROM' to rd."
  mkdir -p usr/lib/locale
  cp -rf $LOCALE_ARCHIVE_FROM $LOCALE_ARCHIVE_TO
else
  echo "File '$LOCALE_ARCHIVE_FROM' doesn't exists. skipping."
fi

# Changing encoding
sudo sed -i 's/OPTIONS="$OPTIONS"/OPTIONS="$OPTIONS,locale=ja_JP.utf8"/g' usr/sbin/rebuildfstab
sudo sed -i 's/OPTIONS="$OPTIONS,ro,umask=000"/OPTIONS="$OPTIONS,ro,umask=000,iocharset=utf8"/g' usr/sbin/rebuildfstab
sudo sed -i 's#\(msdos\|fat\))#\0 grep -qi "lang=[^ ]*utf8" /proc/cmdline \&\& OPTIONS="${OPTIONS},codepage=932,iocharset=utf8"; #' usr/sbin/rebuildfstab

# Keymappings
if [ -d /home/tc/kmaps/usr ];
then 
   mv /home/tc/kmaps/usr/share/kmap/qwerty usr/share/kmap/
   rm -rf /home/tc/kmaps
fi

cd ~
