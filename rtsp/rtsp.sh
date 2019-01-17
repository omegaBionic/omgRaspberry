#!/bin/bash

function ctrl_c() {
    killall -9 omxplayer
    if [ ${?} -eq "0" ]; then
        echo "Kill OK."
    else
        echo "Kill error."
    fi
    exit 1
}

echo "Run omx 1."
/usr/bin/omxplayer --loop --avdict rtsp_transport:tcp --win "0 0 640 360" --no-osd --live rtsp://admin:GST4Cam@192.168.1.1:554 &
echo "Run omx 2."
/usr/bin/omxplayer --loop --avdict rtsp_transport:tcp --win "640 0 1280 360" --no-osd --live rtsp://admin:GST4Cam@192.168.1.1:554 &
echo "Run omx 3."
/usr/bin/omxplayerr --loop --avdict rtsp_transport:tcp --win "0 360 640 720" --no-osd --live rtsp://admin:GST4Cam@192.168.1.1:554 &
echo "Run omx 4."
/usr/bin/omxplayer --loop --avdict rtsp_transport:tcp --win "640 360 1280 720" --no-osd --live rtsp://admin:GST4Cam@192.168.1.1:554 &

echo "Omx launched."
while true; do
    trap ctrl_c INT
    sleep 0.1
done
