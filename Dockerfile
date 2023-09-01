# Use a base image with ffmpeg pre-installed
FROM jrottenberg/ffmpeg:latest

# Copy the reconnection script into the container
COPY reconnect.sh /reconnect.sh

# Make the script executable
RUN chmod +x /reconnect.sh

# Set the entrypoint to the reconnection script
ENTRYPOINT ["/reconnect.sh"]