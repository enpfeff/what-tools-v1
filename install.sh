#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

install_dir=/opt/what-tools
bin=${install_dir}/bin

mkdir -p ${install_dir}
cp -rf config lib entries bin package.json uninstall.sh ${install_dir}
chmod -R 775 ${install_dir}
chown -R media:data ${install_dir}
cd ${install_dir}
npm install
chmod -R 775 ${install_dir}/node_modules

cp -f ${bin}/plex-updater.sh /usr/bin/plex-updater && chmod 775 /usr/bin/plex-updater
cp -f ${bin}/process-tv.sh /usr/bin/process-tv && chmod 775 /usr/bin/process-tv
