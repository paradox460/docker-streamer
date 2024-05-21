#! /usr/bin/env sh
pulseaudio -D --exit-idle-time=-1
pacmd load-module module-virtual-sink sink_name=v1
pacmd set-default-sink v1
pacmd set-default-source v1.monitor

ffmpeg \
  -i $SOURCE_STREAM\
  -f pulse \
  -i default \
  -c:v libx264 \
  -c:a aac \
  -preset veryfast \
  -pix_fmt yuv420p \
  -fflags nobuffer \
  -map 0:v -map 1:a \
  -f flv $RTMP_URL &

spotifyd --no-daemon --backend pulseaudio -d dockerstreamer --username="$SPOTIFY_USERNAME" --password="$SPOTIFY_PASSWORD" --use-mpris=false
