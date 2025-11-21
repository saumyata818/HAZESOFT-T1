FROM nginx:alpine

# Install git
RUN apk add --no-cache git

# Clone repo
RUN git clone https://github.com/veekrum/task /tmp/task_repo

# Copy the entire site folder to nginx root
RUN cp -r /tmp/task_repo/site /usr/share/nginx/html/

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
