#!/bin/sh
# Shell script for new Windows2012r2 Image

###
# KMS KEYS: https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/jj612867(v=ws.11)
###
mkdir $HOME/dl
mkdir $HOME/isoMount
mkdir $HOME/newIso
curl http://example.com/IsoFile.iso -o $HOME/dl/windows2012r2.iso -s
sudo mount -o loop $HOME/dl/windows2012r2.iso $HOME/isoMount
sudo cp $HOME/isoMount/* $HOME/newIso -r
sudo umount $HOME/isoMount
curl https://raw.githubusercontent.com/azorac/windowsImging/master/Autounattend.xml -o $HOME/dl/Autounattend.xml
sudo cp $HOME/dl/Autounattend.xml $HOME/newIso/Autounattend.xml
#Create boot
genisoimage -b boot/etfsboot.com -no-emul-boot -boot-load-size 8 -iso-level 2 -udf -joliet -D -N -relaxed-filenames -o $HOME/newfile.iso $HOME/newIso
