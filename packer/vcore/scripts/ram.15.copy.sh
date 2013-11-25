# ram.15.copy.sh

cd ~/core

MODULES_DIR=/lib/modules/$(uname -r)


# Overriding system files
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


# Setting vi/vim auto-switch
cat << EOF >> usr/local/bin/vi
#!/bin/sh
[ -z \`which vim\` ] && exec /usr/bin/vi \$@ || exec vim \$@
EOF
chmod 755 usr/local/bin/vi

cd ~
