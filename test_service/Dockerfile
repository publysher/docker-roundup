FROM alpine:latest

EXPOSE 9000
STOPSIGNAL -9

CMD sleep 1 && while true; do nc -lk -s 0.0.0.0 -p 9000 -e 'echo yes'; done
