#
# Debian-sshcd Debian Jessie + Nginx webserver and OpenSSH Server
#
# Build: sudo docker build .
# Usage: docker run -d -p 8080:80 -p 2222:22 -e SSH_KEY="$(cat ~/.ssh/id_rsa.pub)" "Container ID"
#
FROM krlmlr/debian-ssh

# Mark this system as noninteractive.
ENV DEBIAN_FRONTEND noninteractive

# Install and configure all the software.
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62; \
    echo "deb http://nginx.org/packages/debian/ jessie nginx"  > /etc/apt/sources.list.d/nginx.list; \
    apt-get update; apt-get --yes upgrade; apt-get install --yes nginx; apt-get clean

# Iniciar el servidor web.
CMD ["nginx", "-g", "daemon off;"]

# Expose related ports.
EXPOSE 8080