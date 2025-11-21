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
# Note: The mapping to 9000 on the host is done when running the container, not in the Dockerfile.
EXPOSE 80

# Command to run Nginx in the foreground
# The -g 'daemon off;' is essential for running Nginx inside Docker.
CMD ["nginx", "-g", "daemon off;"]
