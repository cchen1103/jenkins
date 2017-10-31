pipeline {
  agent {
    node any
  }
  stages {
    stage('Jenkins Docker Image Build') {
      echo 'Build Jenkins Docker Image Through Dockerfile'
      git url: 'https://github.com/cchen1103/jenkins.git'
      docker build . --tag cchen1103/jenkins
    }
  }
}
