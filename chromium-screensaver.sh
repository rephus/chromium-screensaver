#!/bin/bash

app="https://www.youtube.com/embed/jI-kpVh6e1U?loop=1&iv_load_policy=3&controls=0&autoplay=1&autohide=1&showinfo=0" 
wait=5000 #Time in miliseconds

chromium_id=""
while true; do 
  idle=`xprintidle`
  if [ $idle -gt $wait ]; then
    if [ -z $chromium_id ]; then
      
      chromium-browser --app="$app" --start-maximized --fast-start &>> chromium.log &
      chromium_id="$!"
      echo "Away, running screensaver (id:$chromium_id)"
    fi
  elif [ $chromium_id ]; then #Screensaver is running
    echo "Welcome back, closing screensaver (id:$chromium_id)"
    kill "$chromium_id"
    chromium_id=""
  fi
  sleep 1
done 
