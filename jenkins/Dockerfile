FROM jenkinsci/blueocean:latest
MAINTAINER Marc Gaines <marc.gaines@gaines-solutions.de>

USER jenkins

### Preinstall plugins ###
COPY plugins.txt /var/jenkins_home/plugins.txt
RUN /usr/local/bin/plugins.sh /var/jenkins_home/plugins.txt
