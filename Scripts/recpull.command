#! /bin/bash

# Preconditions: screen recording is made manually

# Script retrievs your latest screen recording by mentioned path from device and move it to destination folder
# Then script opens screen recording by any appropriate app

echo "Pulling newest screen recording..."
file=$(adb shell ls -r -t "sdcard/PATH_TO_SCREEN_RECORDINGS" | grep mp4 | tail -n1)
for file in "$file"
do
adb pull "sdcard/PATH_TO_SCREEN_RECORDINGS/$file" ~/PATH_TO_DESTINATION_FOLDER
done
echo "Opening screen recording with Monosnap..."
open -a "Monosnap" ~/PATH_TO_DESTINATION_FOLDER/"$file"