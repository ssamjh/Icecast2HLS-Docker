FROM jrottenberg/ffmpeg:latest

WORKDIR /app

COPY restream.sh /app/

CMD ["/app/restream.sh"]
