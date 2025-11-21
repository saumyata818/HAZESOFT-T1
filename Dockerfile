FROM alpine:latest

# Install nginx and git
RUN apk update && apk add nginx git

# Clone repo
RUN git clone https://github.com/veekrum/task /tmp/task_repo

# Copy site folder
RUN mkdir -p /usr/share/nginx/html
RUN cp -r /tmp/task_repo/site /usr/share/nginx/html/

# Create nginx conf.d directory
RUN mkdir -p /etc/nginx/conf.d

# Overwrite default nginx config using a heredoc
RUN sh -c 'cat <<EOF > /etc/nginx/conf.d/default.conf
server {
    listen 80;
    server_name localhost;
    root /usr/share/nginx/html;
    index index.html;
    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF'

# Expose port
EXPOSE 9000

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
