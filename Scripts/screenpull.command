#! /bin/bash

# Preconditions: screenshot is made manually

# Script retrievs your latest screenshot by mentioned path from device and move it to destination folder
# Then script opens screenshot by any фppropriate app

echo "Pulling newest screenshot..."
file=$(adb shell ls -r -t "sdcard/PATH_TO_SCREENSHOTS" | grep jpg | tail -n1)
for file in "$file"
do
adb pull "sdcard/PATH_TO_SCREENSHOTS/$file" ~/PATH_TO_DESTINATION_FOLDER
done
echo "Opening screenshot with Monosnap..."
open -a "Monosnap" ~/PATH_TO_DESTINATION_FOLDER/"$file"