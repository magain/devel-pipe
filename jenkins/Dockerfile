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
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.05.0-ce.tgz && \
 tar --strip-components=1 -xvzf docker-17.05.0-ce.tgz -C /usr/local/bin

### Change ownership for docker "engine"
RUN chown jenkins:jenkins /var/run/docker.sock

USER jenkins
