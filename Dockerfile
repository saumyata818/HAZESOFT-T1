# Use the official alpine image as the base
FROM alpine:latest

# Install nginx and git
RUN apk update && \
    apk add nginx git && \
    rm -rf /var/cache/apk/*

# Clone the target repository
RUN git clone https://github.com/veekrum/task /tmp/task_repo

# FIX: Copy the CONTENTS of the 'site' folder directly to the Nginx root.
# This makes the file accessible at the container's root: /usr/share/nginx/html/index.html
RUN cp -R /tmp/task_repo/site/* /usr/share/nginx/html/

# Clean up the temporary cloned repository
RUN rm -rf /tmp/task_repo

# Expose the default Nginx port (80)
EXPOSE 80

# Command to run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
