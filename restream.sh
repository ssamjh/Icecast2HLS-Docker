#!/bin/bash

function restream {
    INPUT=$1
    OUTPUT=$2

    while true; do
        ffmpeg -i $INPUT -c copy -f flv $OUTPUT
        STATUS=$?

        # If FFmpeg exits without error, break the loop
        if [ $STATUS -eq 0 ]; then
            break
        fi

        # If FFmpeg exits with an error, wait for 1 minute and then retry
        echo "Stream $INPUT encountered an error. Retrying in 1 minute..."
        sleep 60
    done
}

while IFS= read -r line; do
    IFS=',' read -ra ADDR <<< "$line"
    INPUT=${ADDR[0]}
    OUTPUT=${ADDR[1]}
    restream $INPUT $OUTPUT &
done < /app/streams.txt
