#!/bin/bash

# Use environment variables or default values if not set
INPUT_URL=${INPUT_URL}
OUTPUT_URL=${OUTPUT_URL}

while true; do
    ffmpeg -i $INPUT_URL -c copy -f flv $OUTPUT_URL
    echo "Stream went down. Reconnecting in 5 seconds..."
    sleep 5
done
