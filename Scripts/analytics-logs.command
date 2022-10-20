#! /bin/bash

# Script can help to retrieve logs about specific event from specific loggers, and opens collected data as a file via appropriate app (e.g. VSCode)

echo "Please, enter the name of event you want to search: "
read event
echo "Logcat is running. Searching [$event] event/parameter. Press [CONTROL+C] to stop logcat session"
function ctrl_c()
{
  echo ": logcat session stoped. Opening file with logs ..."
}
trap ctrl_c INT
adb logcat | grep -iE "LOGGER_NAME.*$event|LOGGER_NAME.*$event|LOGGER_NAME.*$event|LOGGER_NAME.*$event|LOGGER_NAME.*$event|LOGGER_NAME.*$event" > ~/PATH_TO_OUTPUT_LOG_FILE/FILE_NAME.json
sleep 2
open -a "Visual Studio Code" ~/PATH_TO_OUTPUT_LOG_FILE/FILE_NAME.json