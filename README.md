# HAZESOFT-T1: Nginx and Git Dockerization

This repository contains a `Dockerfile` to create a minimal Nginx server using Alpine Linux. The server is configured to host the contents of the `site` directory cloned from a specific external repository.

## Done Tasks

* Used the **alpine:latest** image.
* Installed **Nginx** and **Git**.
* Cloned the repository **https://github.com/veekrum/task** into a temporary directory.
* Copied the **`site`** directory from the cloned repo to the Nginx default document root (`/usr/share/nginx/html/`).
* The container is configured to expose **port 80** (Nginx default).
* The Nginx server is started in the foreground using `CMD ["nginx", "-g", "daemon off;"]`.

## How to Run the Docker Container

1.  **Build the image:**
    ```bash
    docker build -t hazesoft-t1-image .
    ```

2.  **Run the container and expose port 9000 on the host:**
    The Dockerfile exposes port 80, which is mapped to port 9000 on the host machine using the `-p 9000:80` flag.
    ```bash
    docker run -d -p 9000:80 --name hazesoft-t1-container hazesoft-t1-image
    ```

## Verification (Expected Output)

Once the container is running, the HTML file should be accessible at:
