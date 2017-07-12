FROM blueocean

USER jenkins

### Preinstall plugins ###
COPY plugins.txt /var/jenkins_home/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
