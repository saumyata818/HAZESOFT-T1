# Use alpine image
FROM alpine:latest

# Install nginx and git
RUN apk update && apk add nginx git

# Clone the repo
RUN git clone https://github.com/veekrum/task /tmp/task_repo

# Copy site folder to nginx html directory
RUN mkdir -p /usr/share/nginx/html/site
RUN cp -r /tmp/task_repo/site/* /usr/share/nginx/html/site/

# Expose port 9000
EXPOSE 9000

# Run nginx on startup
CMD ["nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]
