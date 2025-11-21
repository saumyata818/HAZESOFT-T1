# Use alpine image
FROM alpine:latest

# Install nginx and git
RUN apk update && apk add nginx git

# Clone the repo
RUN git clone https://github.com/veekrum/task /tmp/task_repo

# Create nginx html directory (if not exists)
RUN mkdir -p /usr/share/nginx/html/

# Copy the site folder into nginx root
RUN cp -r /tmp/task_repo/site /usr/share/nginx/html/

# Expose port 9000
EXPOSE 9000

# Run nginx with correct config
CMD ["nginx", "-g", "daemon off;"]
