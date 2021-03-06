FROM openjdk:8-jdk-alpine
MAINTAINER Chaofeng Chen <cchen1103@gmail.com>

ARG VERSION=2.7.3
ARG JENKINS_HOME=/jenkins
ARG JENKINS_PORT=8080

EXPOSE ${JENKINS_PORT}

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN apk add --update --no-cache \
  fontconfig \
  ttf-dejavu \
  git \
  docker \
  bash \
  python \
  sudo \
  wget

RUN cd / && \
  wget http://updates.jenkins-ci.org/download/war/${VERSION}/jenkins.war
RUN addgroup -S -g 10000 jenkins \
  && adduser -S -u 10000 -h ${JENKINS_HOME} -G jenkins jenkins \
  && chown jenkins:jenkins ${JENKINS_HOME}
RUN sed -e 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' \
      -i /etc/sudoers && addgroup jenkins wheel

VOLUME ["${JENKINS_HOME}"]
USER jenkins
ENV JENKINS_HOME=${JENKINS_HOME}
ENTRYPOINT ["entrypoint.sh"]
CMD "-h"

HEALTHCHECK --start-period=1m \
  CMD  nc -nz localhost:8080

LABEL description="standalone jenkins master in docker"
LABEL version="${VERSION}"
LABEL name="jenkins"
