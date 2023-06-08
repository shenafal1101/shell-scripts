#! /bin/bash

# Script can help to retrieve logs about specific event from specific loggers, and opens collected data via appropriate text editor

echo "Please, enter the name of event you want to search: "
read event
echo "Logcat is running. Searching [$event] event. Press [CONTROL+C] to stop logcat session"
function ctrl_c()
{
  echo ": logcat session stoped. Checking that event is logged to all loggers ..."
}
trap ctrl_c INT
adb logcat | grep -iE "LOGGER_NAME_1.*$event|LOGGER_NAME_2.*$event|LOGGER_NAME_3.*$event|LOGGER_NAME_4.*$event|LOGGER_NAME_5.*$event|LOGGER_NAME_6.*$event" > ~/PATH_TO_OUTPUT_LOG_FILE/"$event"_analytics.json
sleep 5

# Check that target event is logged to all mentioned loggers

loggers=("LOGGER_NAME_1" "LOGGER_NAME_2" "LOGGER_NAME_3" "LOGGER_NAME_4" "LOGGER_NAME_5" "LOGGER_NAME_6")
missing_loggers=()
for logger in "${loggers[@]}"
do
  if ! grep -q "$logger" ~/PATH_TO_OUTPUT_LOG_FILE/"$event"_analytics.json; then
    missing_loggers+=("$logger")
  fi
done

if [ ${#missing_loggers[@]} -gt 0 ]; then
  echo "Error: The following loggers are missing in the output file:"
  for logger in "${missing_loggers[@]}"
  do
    echo "- $logger"
  done
else
  echo "Looks nice! Opening the output file ..."
open -a "TEXT_EDITOR_NAME" ~/PATH_TO_OUTPUT_LOG_FILE/"$event"_analytics.json
fi