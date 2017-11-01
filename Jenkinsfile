pipeline {
  agent {
    node any
  }
  stages {
    stage('Jenkins Docker Image Build') {
      sh '''
        echo "Build Jenkins Docker Image Through Dockerfile"
        docker build . --tag cchen1103/jenkins
      '''
    }
  }
}
