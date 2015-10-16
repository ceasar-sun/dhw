#!/bin/bash

DISPLAY_URL="https://master:9090/"
BROWSER_PARAM="--use-gl --allow-file-access-from-files --no-default-browser-check  --disable-session-crashed-bubble  --disable-popup-blocking --no-first-run --allow-running-insecure-content"

sudo systemctl status sage2Server.service
sudo drbl-doit systemctl start lightdm.service

google-chrome $BROWSER_PARAM $sub_param
