#! /bin/bash

# Script is uninstalling existing .apk on your device file and install the latest new one which you already downloaded on your local machine

echo "deleting existing apk"
adb uninstall PACKAGE_NAME
sleep 2
echo "searching for the latest downloaded apk"
file=$(ls -r -t ~/PATH_TO_FOLDER_WITH_APK | grep apk | tail -n1)
for file in $file
do
echo "install $file"
adb install ~/PATH_TO_APK_FILE
done
