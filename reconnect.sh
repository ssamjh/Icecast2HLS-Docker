#!/bin/bash

# Use environment variables or default values if not set
INPUT_URL=${INPUT_URL}
OUTPUT_URL=${OUTPUT_URL}

while true; do
    ffmpeg -re -hide_banner -i $INPUT_URL -c copy -bsf:a aac_adtstoasc -f flv $OUTPUT_URL -loglevel error
    echo "Stream went down. Reconnecting in 30 seconds..."
    sleep 30
done
