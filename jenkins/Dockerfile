FROM jenkins

#USER root

#ENV GOSU_VERSION 1.9
#RUN set -x \
#    && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \
#    && dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
#    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
#    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc" \
#    && export GNUPGHOME="$(mktemp -d)" \
#    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
#    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
#    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
#    && chmod +x /usr/local/bin/gosu \
#    && gosu nobody true

USER jenkins

### Preinstall additionally needed plugins ###
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

USER root

### Install docker client ###
RUN mkdir -p /tmp/download && \
 curl -L https://get.docker.com/builds/Linux/x86_64/docker-1.11.1.tgz | tar -xz -C /tmp/download && \
 rm -rf /tmp/download/docker/dockerd && \
 mv /tmp/download/docker/docker* /usr/local/bin/ && \
 rm -rf /tmp/download && \
 groupadd -g 1001 docker && \
 usermod -aG docker jenkins

### Give user jenkins permissions on volume (in my case folder) /jenkins/data
#COPY entrypoint.sh /entrypoint.sh
#RUN chmod u+x /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]
#CMD ["jenkins", "/bin/tini", "--", "/usr/local/bin/jenkins.sh"]

USER jenkins
