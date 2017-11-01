node('master'){
  def jenkins

  stage('Pull jenkins repo') {
    /* Pull jenkins docker builder git repo */

    checkout scm

  }

  stage('Build jenkins image') {
    /* Build jenkins docker image */

    jenkins = docker.build("cchen1103/jenkins")

  }

  stage('Test jenkins image') {
    /* Launch jenkins */

    jenkins.inside {
      sh 'java -Djava.awt.headless=true -jar jenkins.war'
    }

  }

  stage('Push jenkins image') {
    /* Push jenkins image to dockerhub */

    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
      jenkins.push("${env.BUILD_NUMBER}")
      jenkins.push("latest")
    }

  }
}
