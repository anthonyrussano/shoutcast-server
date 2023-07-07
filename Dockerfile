FROM ubuntu:latest
# # Use an official Alpine Linux base image
# FROM alpine:latest

# Set environment variables
ENV SC_PORT 8090

# Install necessary packages
RUN apt-get update && apt-get install -y wget gcc libmp3lame-dev
# RUN apk add --no-cache lame

# Copy the Shoutcast server files and configuration
COPY . /sc_serv/

# Set the working directory
WORKDIR /sc_serv

# Expose the Shoutcast server port
EXPOSE $SC_PORT

# Run the Shoutcast server
CMD ["./sc_serv", "sc_serv.conf"]
