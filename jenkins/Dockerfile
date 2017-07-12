FROM jenkins

USER jenkins

### Preinstall additionally needed plugins ###
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

USER root

### Install docker client ###
#RUN mkdir -p /tmp/download && \
# curl -L https://get.docker.com/builds/Linux/x86_64/docker-1.11.1.tgz | tar -xz -C /tmp/download && \
# rm -rf /tmp/download/docker/dockerd && \
# mv /tmp/download/docker/docker* /usr/local/bin/ && \
# rm -rf /tmp/download && \
# groupadd -g 1001 docker && \
# usermod -aG docker jenkins


### Install docker
#RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.05.0-ce.tgz && \
# tar --strip-components=1 -xvzf docker-17.05.0-ce.tgz -C /usr/local/bin

RUN apt-get update
RUN apt-get purge "docker.io*"
RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates gnupg2
RUN apt-key adv \
   --keyserver hkp://ha.pool.sks-keyservers.net:80 \
   --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list
RUN apt-get update
RUN apt-cache policy docker-engine
RUN apt-get update
RUN apt-get install -y docker-engine
RUN gpasswd -a jenkins docker

### Change ownership for docker "engine"
RUN chown jenkins:jenkins /var/run/docker.sock

USER jenkins
