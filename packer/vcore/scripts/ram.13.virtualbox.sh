# ram.13.virtualbox.sh

cd ~/core

MODULES_DIR=lib/modules/$(uname -r)
FILES="\
$MODULES_DIR/vm-ga $MODULES_DIR/modules.dep \
$MODULES_DIR/modules.symbols $MODULES_DIR/modules.alias \
sbin/mount.vboxsf "
for FILE in $FILES;
do
  if [ -f /$FILE ];
  then
    echo "Copying '/$FILE' to rd."
    cp -f /$FILE $FILE
  elif [ -d /$FILE ];
  then
    echo "Copying '/$FILE' to rd."
    cp -rf /$FILE $FILE
  else
    echo "File '/$FILE' doesn't exists. skipping."
  fi
done

cd ~
