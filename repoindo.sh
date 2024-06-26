#!/bin/bash

source /etc/os-release
pre="/etc/apt/sources.list"
cp "${pre}" /root/

if [[ ${ID} == 'ubuntu' && $(echo "${VERSION_ID}" |  cut -d. -f1) == 20 ]]; then
cat > ${pre} <<-END
deb http://kartolo.sby.datautama.net.id/ubuntu/ focal main restricted universe multiverse
deb http://kartolo.sby.datautama.net.id/ubuntu/ focal-updates main restricted universe multiverse
deb http://kartolo.sby.datautama.net.id/ubuntu/ focal-security main restricted universe multiverse
deb http://kartolo.sby.datautama.net.id/ubuntu/ focal-backports main restricted universe multiverse
deb http://kartolo.sby.datautama.net.id/ubuntu/ focal-proposed main restricted universe multiverse
END
apt update
apt upgrade  # Menambahkan perintah untuk melakukan upgrade
rm repoindo.sh  # Menambahkan perintah untuk menghapus file repoindo.sh setelah selesai
fi

if [[ ${ID} == 'debian' && ${VERSION_ID} == 10 ]]; then
cat > ${pre} <<-END
deb http://kartolo.sby.datautama.net.id/debian/ buster main contrib non-free
deb http://kartolo.sby.datautama.net.id/debian/ buster-updates main contrib non-free
deb http://kartolo.sby.datautama.net.id/debian-security/ buster/updates main contrib non-free
END
apt update
apt upgrade  # Menambahkan perintah untuk melakukan upgrade
rm repoindo.sh  # Menambahkan perintah untuk menghapus file repoindo.sh setelah selesai
fi