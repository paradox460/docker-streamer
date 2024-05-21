FROM alpine
RUN <<EOF
apk update
apk add pulseaudio alsa-plugins-pulse pulseaudio-utils ffmpeg spotifyd
adduser -D streamer
EOF
USER streamer
COPY --chown=streamer:streamer --chmod=744 ./run.sh .
ENTRYPOINT [ "sh", "-c", "/run.sh" ]
