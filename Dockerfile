FROM ubuntu:latest

RUN apt-get update && apt-get install -y wget gcc libmp3lame-dev

RUN curl -o /tmp/shoutcast.tar.gz https://pin.wikip.co/api/shares/shoutcast-server/files/6a2eefd6-0d0a-4c86-9283-1e809de1be46 \
  && tar -xzf /tmp/shoutcast.tar.gz -C /tmp \
  && rm /tmp/shoutcast.tar.gz
COPY sc_serv.conf /tmp/

WORKDIR /tmp

EXPOSE 8000

CMD ["./tmp/sc_serv", "/tmp/sc_serv.conf"]
