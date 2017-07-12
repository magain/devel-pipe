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
RUN apt-get update && \
 apt-get purge "docker.io*" && \
 apt-get update && \
 apt-get install -y apt-transport-https ca-certificates && \
 apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
 echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list && \
 apt-get update && \
 apt-get install -y docker-engine=1.11.2-0~jessie && \

### Change ownership for docker "engine"
RUN chown jenkins:jenkins /var/run/docker.sock

USER jenkins
