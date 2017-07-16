FROM jenkins:2.60.1-alpine
MAINTAINER Marc Gaines <marc.gaines@gaines-solutions.de>

USER jenkins

### Preinstall plugins ###
COPY plugins.txt /var/jenkins_home/plugins.txt
RUN /usr/local/bin/plugins.sh /var/jenkins_home/plugins.txt

USER root

RUN apk --no-cache add --update \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
    tini docker

RUN chmod +x /usr/bin/docker

RUN curl -sL https://github.com/docker/docker/raw/master/hack/dind > /usr/local/bin/dind \
    && chmod +x /usr/local/bin/dind

# Kinda based on https://github.com/jpetazzo/dind/blob/master/alpine/Dockerfile

# Install Docker from Alpine repos along with its dependencies
# and update to the latest version
#RUN apk --no-cache add docker bash \
#    && curl -sL https://get.docker.com/builds/Linux/x86_64/docker-1.11.1 > /usr/bin/docker \
#    && chmod +x /usr/bin/docker \
#    && curl -sL https://github.com/docker/docker/raw/master/hack/dind > /usr/local/bin/dind \
#    && chmod +x /usr/local/bin/dind

VOLUME /var/lib/docker

# Start jenkins
ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]

# Start docker daemon
CMD ["dind", "docker", "daemon"]
