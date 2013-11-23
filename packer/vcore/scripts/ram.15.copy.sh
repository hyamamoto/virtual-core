# ram.15.copy.sh

cd ~/core

MODULES_DIR=/lib/modules/$(uname -r)
FILES="\
etc/hostname etc/inittab etc/passwd etc/group etc/shadow \
etc/sudoers etc/issue etc/motd \
etc/sysconfig/language etc/sysconfig/keymap etc/sysconfig/desktop \
opt/.filetool.lst opt/.xfiletool.lst \
"
for FILE in $FILES;
do
  if [ -f /$FILE ];
  then
    echo "Copying '/$FILE' to rd."
    cp -rf /$FILE $FILE
  elif [ -d /$FILE ];
  then
    echo "Copying '/$FILE' to rd."
    cp -rf /$FILE $FILE
  else
    echo "File '/$FILE' doesn't exists. skipping."
  fi
done

cd ~
