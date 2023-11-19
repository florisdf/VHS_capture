#!/usr/bin/bash

# Capture input video with mencoder
mencoder tv:// -tv driver=v4l2:width=720:height=576:outfmt=uyvy:device=/dev/video0:input=0:fps=25:alsa:amode=1:audiorate=44100:adevice=plughw.2,0:forceaudio:immediatemode=0 -ovc x264 -oac mp3lame -x264encopts preset=medium -o "$1.avi"

# Convert AVI to MP4 suitable for playing on iPhone
ffmpeg -i "$1.avi" -c:v libx264 -profile:v main -level 3.1 -preset medium -crf 23 -x264-params ref=4 -c:a aac -b:a 128k -ac 1 -movflags +faststart "$1.mp4"

# Remove AVI
rm "$1.avi"
