FROM tomcat:alpine
MAINTAINER Chaofeng.chen@gdit.com

# set arguments
ARG VERSION=2.7.3
ARG URL=
ARG JENKINS_PORT=443

# export service port
EXPOSE ${JENKINS_PORT}

# install packages:
RUN apk add --update --no-cache \
  openjdk8-jre-base \
  ttf-dejavu \
  && rm -rf /var/cache/apk/*

# download jenkins war file
RUN wget http://updates.jenkins-ci.org/download/war/${VERSION}/jenkins.war

# config tomcat for jenkins
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY manager.xml /usr/local/tomcat/conf/Catalina/localhost/manager.xml

# Start tomcat for jenkins
RUN /usr/local/tomcat/bin/startup.sh
