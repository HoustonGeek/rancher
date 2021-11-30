#!/bin/bash
#Write GPT signature
sudo sgdisk -og /dev/sda 
#create EFI and LVM partition
sudo sgdisk -n 1::+512MiB -t 1:ef00 -c 1:"EFI System Partition" -n 2::$ENDSECTOR -t 2:8e00 -c 2:"Linux LVM" /dev/sda
#pvcreate on the 2nd partition
sudo pvcreate /dev/sda2
#create our volume group (can add to it later)
sudo vgcreate vgmain /dev/sda2
#create Logival Volumes for boot, swap, root, var and home - change the sizes as needed
sudo lvcreate -L 512MiB -n lvboot vgmain
sudo lvcreate -L 2GiB -n lvswap vgmain
sudo lvcreate -L 6GiB -n lvhome vgmain
sudo lvcreate -L 10GiB -n lvvar vgmain
sudo lvcreate -l +100%FREE -n lvroot vgmain
