#!/bin/bash

# Enable job control
set -m
# Start agent in the background
(~/.local/bin/ngrok http 8080 &)
sleep 10

url="{$(curl http://localhost:4040/api/tunnels | grep -oP '"public_url":"(.*?)"')}"
echo "$url" > ngrokurl.json
git commit -am "$(date +%d-%m-%yT%H:%M:%S)"
git push