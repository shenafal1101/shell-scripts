#! /bin/bash

# Script configurating proxy on your device and launch Charles Proxy app.
# Then script is waiting till you close the Charles after you finished your activities
# After Charles closure, script reset device proxy settings to default

echo '--- Configurating global proxy settings on your device ---'
adb shell settings put global http_proxy xxx.xxx.xxx.xxx:xxxx
sleep 1
echo '--- Launching Charles Proxy ---'
open --wait-apps -a Charles
echo '--- Charles Proxy is closed. Global proxy settings on your device are set by default ---'
sleep 1
adb shell settings put global http_proxy :0
echo '--- Done. Press Command+Q to close terminal window ---'