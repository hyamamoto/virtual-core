# locale.sh

# Setting up locales
if [ -f /etc/sysconfig/language ]; then
  . /etc/sysconfig/language
else
  LANG=C
fi

if [ $LANG="C" ]; then
  echo "LANG=$LANG; LC_ALL=$LANG" >> /home/tc/.profile
  echo "export LANG LC_ALL" >> /home/tc/.profile

  if [ -f /home/tc/locale-archive ]; then
    mkdir -p /usr/lib/locale
    mv -f /home/tc/locale-archive /usr/lib/locale/locale-archive
  fi
fi

