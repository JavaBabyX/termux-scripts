#!/bin/bash

#Licensed under # GNU Lesser general license v2
echo "By JavaBabyX ,Remove repeated text you don't want without leaving your shell"

#//from my folder t2// this helps with dealing with adb scripts for package disabling while testing and other stuff
# or means i forgort the right usage 
# I used like this: adb shell pm list packages -system or -s  >> sysappoff.sh; chmod +x sysappoff.sh
# then ./textreplace.sh
# then sysappoff.sh
# then package: or what your file shows [use cat "file name" and you'll see what to remove]
# then adb shell pm disable-user
# then 2
# then i find critical system apps not to disable and remove from file using vim or nano, otherwise you'll 
# have a headache preferably have otg keyboard in case something goes wrong then you can use that to enable everything but Ill have a list for samsung one ui 3 soon
# then ./appsysoff
echo "type full filename"
read -p "Enter the file name" filename

read -p "Enter the text in the file" text

echo "Don't put space before or after your text" 
read -p "Enter the the replace text" newtext

echo "Choose a number"
read -p "Add: 1, space before. 2, space after. 3, space 1&2, Press Enter for none " spacing

# if the script is not working remove option 3 or I missed something 

if ["$spacing" = "1" ]: then
    newtext=" ${newtext}"
if ["$spacing" = "2" ]: then
    newtext="${newtext} "
if ["$spacing" = "3" ]: then
    newtext=" ${newtext} "
else:
    echo "no spaces"
fi

sed -i "s/$text/$newtext/g" "$filename"
