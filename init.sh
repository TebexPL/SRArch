#! /bin/bash


clear;
echo "Welcome to SRArch!";
echo "";


KEYMAPS=();
for f in $(ls /usr/share/kbd/keymaps/**/*.map.gz); do
KEYMAPS+=($(basename $f .map.gz))
done


while true; do

	PS3='Choose your keymap: '
	select opt in "${KEYMAPS[@]}"; do
		if [ -z "$opt" ] ; then
	    	echo "Invalid option";
		else
			KEYMAP=$opt
			break
	    fi
	done
	clear;
    echo "You chose $KEYMAP, is that okay?"
	PS3='Yes/No? '
    select opt in "Yes" "No"; do
		if [[ $opt == "Yes" ]]; then
			break 2
		else 
			break
		fi
    done
	clear
	
done
clear




DISKS=($(ls /dev/disk/by-id | grep -v "\-part[0-9]"))
while true; do

	PS3='Choose your keymap: '
	select opt in "${DISKS[@]}"; do
		if [ -z "$opt" ] ; then
	    	echo "Invalid option";
		else
			DISK=$opt
			break
	    fi
	done
	clear;
    echo "You chose $DISK, is that okay?"
	PS3='Yes/No? '
    select opt in "Yes" "No"; do
		if [[ $opt == "Yes" ]]; then
			break 2
		else 
			break
		fi
    done
	clear
	
done
clear

loadkeys $KEYMAP;
timedatectl set-ntp true;


echo $KEYMAP
echo $DISK
