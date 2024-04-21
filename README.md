# Docker Homework

This is a simple docker system.

## Installation

To build and run the docker image, follow these steps:

1. Clone the repository:

    ```bash
    git@github.com:denzero13/docker_homework.git
    cd docker_homework
    ```

2. Build the program using `make`:

    ```bash
    make
    ```
    Or
    ```bash
    sudo make
    ```
2. Get log from server or client use `docker logs`:

    ```bash
    docker logs server -f
    ```
    Or
    ```bash
    docker logs client -f
    ```
## Aditional comands
Create network:
```bash
 make bridge
```
Create image:
```bash
make img
```
    
Run server container:
```bash
make server
```
Run client container:
```bash
make client
```
## Uninstallation
To remove runed containers use `make rm`:
```bash
make rm
```
To remove docker image with network use `make rmi`:
```bash
make rmi
```
To remove containers with image and network from your system, you can use `make rm-all`:
```bash
make rm-all
