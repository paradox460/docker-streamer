Simple tool for restreaming video, with audio provided by spotify.

I use it to stream 3d printer build streams to my friends in telegram

# Use

You'll need to build the image first

```sh
docker build -t dockerstreamer .
```

Then you can run it quite simply

```sh
docker run --rm -it -e RTMP_URL='<destination>' -e SOURCE_STREAM='<source>' -E SPOTIFY_USERNAME=<your spotify username> -e SPOTIFY_PASSWORD=<your spotify password> dockerstreamer
```

Opening spotify on another device lets you stream to `dockerstreamer` as if it was any other spotify client
