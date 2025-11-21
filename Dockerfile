# Use the official alpine image as the base
FROM alpine:latest

# Install nginx and git
RUN apk update && \
    apk add nginx git && \
    rm -rf /var/cache/apk/*

# Clone the target repository
# Clone into a temporary directory
RUN git clone https://github.com/veekrum/task /tmp/task_repo

# Copy the 'site' folder from the cloned repo to the default Nginx document root.
# Nginx on alpine uses /usr/share/nginx/html as the default root.
RUN cp -R /tmp/task_repo/site /usr/share/nginx/html/

# Clean up the temporary cloned repository
RUN rm -rf /tmp/task_repo

# Expose the default Nginx port (80)
EXPOSE 80

# Command to run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
