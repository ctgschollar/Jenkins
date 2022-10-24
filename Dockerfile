FROM jenkins/jenkins:lts-jdk11

USER root
RUN apt-get update \
      && apt-get install -y sudo \
                            make \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN groupadd -g 998 docker
RUN usermod -a -G docker jenkins

USER jenkins
# COPY plugins.txt /usr/share/jenkins/plugins.txt
# RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
