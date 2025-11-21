FROM alpine:latest

RUN apk update && apk add nginx git

# Clone repo
RUN git clone https://github.com/veekrum/task /tmp/task_repo

# Copy site folder
RUN mkdir -p /usr/share/nginx/html
RUN cp -r /tmp/task_repo/site /usr/share/nginx/html/

# Overwrite default nginx config
RUN echo 'server {\n\
    listen 80;\n\
    server_name localhost;\n\
    root /usr/share/nginx/html;\n\
    index index.html;\n\
    location / {\n\
        try_files $uri $uri/ =404;\n\
    }\n\
}' > /etc/nginx/conf.d/default.conf

# Expose port
EXPOSE 9000

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
