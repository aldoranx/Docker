Docker

Install OpenSSH Server in a Debian Nginx Image

First in your container create a Dockerfile

    $ mkdir nginx_docker
    $ cd nginx_docker
    $ sudo vim docker

Once your repository is created VIM into the Dockerfile and add your DockerFile configuration


Now to build your Docker Image run the command

    $ sudo docker build .

Before running your Docker image you will need to create an SSH Key for that run the command
    $ ssh-keygen

After creating your ssh key and building your image you nwill eed to run your builded image for that run the command

    $ docker run -d -p 8080:80 -p 2222:22 -e SSH_KEY="$(cat ~/.ssh/id_rsa.pub)" 345c7f3aa6ce

After running your image check if your Nginx Server is running on an HTTP web page

    $ http://192.168.1.50:8080/

Before your SSH into your VM check your container IP address in that cas run the command

    $ docker inspect "your container ID"

Now to SSH into your Container please run the commad 

    $ ssh root@"container IP address" -p 2222

    or

    $ ssh root@localhost -p 2222

You can also cannect to your container using the command

    $ docker exec -it "container ID" /bin/bash