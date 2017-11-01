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
  wget
RUN wget http://updates.jenkins-ci.org/download/war/${VERSION}/jenkins.war
RUN addgroup -S -g 10000 jenkins \
  && adduser -S -u 10000 -h ${JENKINS_HOME} -G jenkins jenkins \
  && chown jenkins:jenkins ${JENKINS_HOME}
RUN touch /var/run/docker.sock && chown jenkins:jenkins /var/run/docker.sock

VOLUME ["${JENKINS_HOME}"]
USER jenkins
WORKDIR ${JENKINS_HOME}
ENV JENKINS_HOME=${JENKINS_HOME}
ENTRYPOINT ["entrypoint.sh"]
CMD "--help"

LABEL description="standalone jenkins master in docker"
LABEL version="${VERSION}"
LABEL name="jenkins"
