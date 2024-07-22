FROM alpine:3.20

# Install ffmpeg and perform cleanup in the same layer
RUN apk add --no-cache ffmpeg && \
    rm -rf /var/cache/apk/* /tmp/*

# Copy the reconnection script into the container
COPY reconnect.sh /reconnect.sh

# Make the script executable
RUN chmod +x /reconnect.sh

# Set the entrypoint to the reconnection script
ENTRYPOINT ["/bin/sh", "/reconnect.sh"]