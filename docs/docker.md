# Docker

- for a comprehensive course on Docker, check out this [Udemy course](https://www.udemy.com/course/docker-mastery); (you can ask <juraj.palka@nanoenergies.cz> to share his personal account credentials for free access)
- simply put: making sure the code runs the same on each machine (putting the environment into a container which stays the same on all machines)
- opensource, from 2013
- host to container infrastructure shift (serverless) -> Docker
- two editions: CE = community edition (free, opensource), EE = enterprise edition (paid)
- three major types of installs (Direct, Mac/Win (Docker for Windows), Cloud (AWS/Azure/Google))
- Stable (quarterly stable update) vs. Edge (beta, released monthly)
- Docker on Windows (two types of containers: Linux Containers and Windows Containers); Docker for Windows (only on Win10 Pro/Ent), uses Hyper-V with any Linux VM for Linux Containers, PowerShell native
  > if you are using Docker on Windows, use PowerShell (For a neater GUI, you can download [cmder](https://cmder.net/)
  > Hyper-V Manager is an app in Windows 10, use it to create, configure and manage virtual machines on a virtualization server (physical computer that provides resources required to run virtual machines)
- use Visual Studio Code (VSCode) IDE for docker files, in-built Docker syntax

## Benefits of Docker

- declare dev environment using Docker containers
- docker image to setup a containerized development environment
- standardize your development environments across machines
- portability across on-prem and cloud environments without limiting your choice of tools, frameworks, and languages
- automated builds
- automated tests
- webhooks, integrate with API-based automated HTTP callbacks
- cloud-managed container registry service
- organizational access control (role-based access to securely share Docker images using Organizations and Teams)
- speed (develop, build, test, deploy, update, recover faster)

## Container

- package up code and all its dependencies into standardized units for development, shipment, deployment
- a docker container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries, settings
- images become containers when they run on Docker Engine (or containers are images running on the Docker Engine)
  > You can think of the image as a text file which describes all the properties of the environment this application should run in. Example: run in Ubuntu 16.4, have Python 3, install xy package etc.
- containers isolate software from its environment and ensure that it works uniformly despite differences for instance between development and staging
- once you have your image ready, you just pull it to a server machine with Docker installed and in runs in the same environment as from where you pulled it
- running instance of an image
- you can have many containers running off the same image
- if you do not assign a name to your container specifically, it will be randomly generated
- containers are usually immutable and ephemeral (=unchanging, temporary, disposable); if we need to change it, we throw it away and re-deploy; containers never change (reliability, scalability, consistency)
- **persistent data**: data volumes, bind mounts
- volumes store data which will remain even after the container is deleted (can be used by the newly created container afterwards)
- we can specify the volume in the docker run when creating the container (volumes can be named to make it easier)
- Bind mounting: maps a host file or directory to a container file or directory (when developing locally I can point the container to the directory on my machine and use edited files locally directly in the container)
- bind mounting allows us to attach an existing directory on our host to a directory inside of a container

Example of running a container which takes files from local directory (bind mounting) enabling local development. You change the file in your IDE and it is immediately reflected in the docker container.
`docker run --name mounted_equity_api -p 5000:5000 -v /C/Users/juraj.palka/Documents/gitlab/general://usr/src/app:ro equity_api`

## Docker image

- the application we want to run
- default image "registry" = Docker Hub
- the building block of a container
- app binaries and dependencies
- metadata about the image data and how to run the image
- an ordered collection of root filesystem changes and the corresponding execution parameters for use within a container runtime
- not a complete OS, no kernel, no kernel modules, no drivers; the host provides the kernel
- made up of file system changes and metadata
- each layer is uniquely identified and only stored once on a host (saves storage space on host and transfer time on push/pull)
- a container is just a single read/write layer on top of image
- images don't have names, images have tags (pointer to a specific image commit)
- same image id can have multiple tags

## Docker networks

- `--network bridge` is the default Docker virtual network, which is NAT'ed behind the Host IP
- `--network host` gains performance by skipping virtual networks (Docker) but sacrifices security of container model (attaches the container directly to the host interface)
- `--network none` leaves you with localhost interface in container
- `docker network create` spawns a new virtual network for you to attach containers to
- network driver is a built-in or a 3rd party extension that gives you virtual network features
- create your apps so frontend/backend sit on the same Docker network -> their inter-communication never leaves host (security)
- all externally exposed ports closed by default (you must manually expose via -p)
- don't rely on IPs -> Docker Networks DNS

## Building images

- on the server you should also install Docker Compose (on your Desktop Docker App either on Windows or Mac OS it is already included in the Desktop app)
- Docker always expects a file called `DockerFile` without any extension to be in the folder/directory; it gives the instructions on how to build the image (containing your app, web, api etc.)
- FROM command (required, usually a minimal Linux distribution like debian or alpine)
- ENV command (optional, sets environment variables; preferred way to inject key/value pairs as they work everywhere, on every OS and config)
- COPY command; copy your source code into the container image
- RUN command; if you wish to put multiple RUN commands into a single layer, use `&&` between the commands
- order of the commands in the `DockerFile` matters as it runs top down building layer upon layer
- CMD command (required) runs every time a new container is run from the image, only one CMD command is allowed
- CMD command can be skipped if it is built from an image including a CMD command, in that case the command is inherited from the source image
- when re-running docker build for an image, unless something has changed in the `DockerFile` it will re-build everything from cache (if some code has changed, everything after it needs to re-run -> keep stuff that doesn't change on top of the `DockerFile` to speed up the repeated builds)
- VOLUME command; creates a directory where data will be stored which will outlive the container until we manually delete the volume
  > Volumes need manual deletion; they won't be removed by cleaning up the container

### Docker Compose

- combination of command line and configuration file
- benefits: configure relationships between containers, save docker container settings in easy-to-read file, create one-liner developer environment startups
- comprised of YAML-formatted file and a CLI tool docker-compose (used for local dev/test automation)
- `docker-compose.yml` file defines services (containers), networks and volumes; a service definition contains configuration that is applied to each container started for that service
- the `.yml` file is hierarchical

- use `docker-compose build` to build the docker container
- use `docker-compose up` to build the listed images and run them

- [best practice](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/) for creating a DockerFile
- [Cloning code into the image](https://dzone.com/articles/clone-code-into-containers-how)

## Installing the docker image with unified environment for Nano

- you need to have docker installed on your machine
- the repository must contain a `dockerfile` which contains instructions on how to build the docker image
- open terminal or windows powershell in the folder containing the repository
- run command `docker build <repository-name> --tag <tag-name>`; this builds the docker image
  > Example for building the general repository with hosting the equity_api: `docker build general --tag equity_api` or `docker build general --t equity_api`
- run command `docker run --name <assign name to your container> -p 5000:5000 <tag-name or image-id>`; this runs the container on the built docker image exposing it on the 5000 port and assigning it the chosen name
  > Example for running the container hosting the equity api: `docker run --name test_equity_api -p 5000:5000 equity_api`
- images are not named, they are tagged
- same image ids listed within `docker image ls` are not different images each taking disc space, they are the same image but under three different versions = tags

[Official python docker image](https://hub.docker.com/_/python)

### Example of installing image with Python

[Some notes for recommended base image for Python application](https://pythonspeed.com/articles/base-image-python-docker-images/)

Example for building an image with python installed and running the equity_api.py in it

- the file `requirements.txt` contains all the python libraries required by your application

```
# telling Docker what base image to use for the container, and implicitly selecting the Python version to use, which in this case is 3.8.5
FROM python:3.8.5

# WORKDIR sets the working directory
WORKDIR /usr/src/app

# The COPY directive simply moves the application into the container image
COPY requirements.txt ./
# calling PyPi (pip) and pointing to the requirements.txt file to install dependencies
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# EXPOSE exposes a port that is used by Flask
EXPOSE 5000

# Adjust the python path to root
ENV PYTHONPATH "${PYTHONPATH}:/usr/src/app"

## CMD directive tells the container what to execute to start the application. In this case, it is telling Python to run index.py
CMD python des/flexdesk_equity/equity.py
```

## Docker and error logging

- error logs should not be stored in `.log` files but instead use `stdout` and `stderr` (logs from all containers and hosts)

## Looking into the container files
Create a snapshot of your container. 
`docker commit <container id> <snapshot name>`
Run bash in the snapshot
`docker run -t -i <snapshot name> /bin/bash`
Use linux bash commands to check out the files

Once finished, remove the committed container along with the committed image to clean up.

## Running multiple services from a single image

[How to run multiple python scripts and an executable files using docker](https://stackoverflow.com/a/53921299/11684102)

#### Simple Docker commands in Windows PowerShell

`--help` after any command to get its documentation and options<br>
`docker version` to check the currently installed version of docker; verify the client<br>
`docker info` to display system wide information regarding the Docker installation (kernel versions, number of containers and images), most config values of engine<br>
`docker` get list of all available commands ("docker <management command> <sub-commmand> (options)")<br>
`docker container ls` list containers (default shows only running containers)<br>
`docker container stop 7ff` stop a docker container (in this case "7ff" represents the first characters of the containerId which uniquely describes it)<br>
`docker container rm b5b 7ff 0c1` to remove specific containers<br>
`docker top` list running processes in specific container<br>
`ctrl+z with ctrl+c` to detach from a running container and return to the terminal without stopping the container (Windows 10 Pro)<br>
`docker exec -ti <container-id> bash` access the container running in the background e.g. install additional libraries<br>
`docker inspect` details of one container config<br>
`docker stats` performance stats for all containers<br>
`docker container stats` display a live stream of container(s) resource usage statistics<br>
`docker container start` start one or more stopped containers<br>
`docker container start <container id> -i` starts a container and prints the console log into your terminal from which you started the container<br>
`docker container run -it` -i (interactive) keep session open even if not attached and -t (tty) allocate a pseudo-TTY<br>
`docker container port <container name>` to get the ports forwarding traffic to the container HOST:CONTAINER<br>
`docker container inspect --format '{{.NetworkSettings.IPAddress}}' <container name>` to get the IP of the container<br>
`docker images -a` lists all images<br>
`docker rmi <image id>` deletes an image<br>
`docker container kill <container id>` stops a running container<br>
`docker container rm <container id>` removes an existing container <br>
`docker container run -it --name proxy python-docker-demo bash` runs a new container named proxy on the image and opening the bash terminal at the same time (use `CTRL + C` to exit python terminal and `exit` to quit the created terminal). this allows you to run different files within the repository which was copied to the image when it was build. This basically opens a terminal within the container repository.<br>
`docker cp milan.py 49d:/usr/src/app/des` copies a local file (milan.py) into the selected image path (49d:/usr/src/app/des)<br>
`docker history <image name>:<image tag>` gives all the information about the changes on the image<br>
`docker run --name equity_api -p 5000:5000 general` when running an API or an app you should set the port on which it should be accessed because otherwise you won't be able to access it<br>
`docker image prune` to clean up just "dangling" images<br>
`docker system prune` will clean up everything<br>
`docker volume ls` lists the volumes; then combine with `docker volume inspect <volume name>` to get more details about specific volume<br>
`docker container logs <container id>` prints the logs from the container<br>

> The `<missing>` info just represents the same image as above.

You don't need to download layers which are already present. Docker never stores the same image data twice. You can have multiple images but build from the same layers.<br>

`docker image inspect <container id>` returns JSON metadata about the image -> all the details about the image

#### Docker code examples with explanation

`docker container run --publish 80:80 nginx`

- looks for the image locally in image cache, if it doesn't find anything it them looks in remote image repository (default Docker Hub)
- downloaded image 'nginx' from Docker HUb
- creates and starts a new container from that image
- gives it a virtual IP on a private network inside the docker engine, opens port 80 on the host IP and forwards to port 80 in container
- starts the container by using CMD in the image Dockerfile
  `docker container run --publish 80:80 --detach nginx`
- same as the above but the container runs in the background of your terminal (terminal does not receive input or display output)
  `docker container run --publish 88:80 --detach --name webhost nginx` = `docker container run -d -p 88:80 --name webhost nginx`
- specifying the name of the docker container
- the docker port publishing format <public port>:<container port>; port conflict errors occur when multiple services are running on the same published port on the same host, not in multiple containers
  Example: 8080:80 and 80:80 won't provide conflict error but 8080:80 and 8080:60 will
  `docker container run -it --name proxy nginx bash`
  will give you a terminal (interactive shell) inside a newly run container called proxy (once you exit it will stop the container)
  `docker container exec -it mysql bash`
  will give you a terminal (interactive shell) inside the already running container mysql (once you exit the container continues to run as it runs in parallel)

## R and Docker

[Rocker](https://www.rocker-project.org/) - docker containers for the R Environment

[The list of rocker containers](https://hub.docker.com/u/rocker)

Create a container with base R
`docker run --rm -ti rocker/r-base`

Create a container with rstudio and launch it in your browser on localhost. After stopping it will remove the container. (Why?)
`docker run -e PASSWORD=yourpassword --rm -p 8787:8787 rocker/rstudio`

To install packages within DockerFile
`RUN install2.r pkg1 pgk2 pkg3 ...`
