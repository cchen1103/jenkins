pipeline {
  agent {
    node {
      label 'master'
    }
  }
  stages {
    stage('Jenkins Docker Image Build') {
      steps {
        sh '''
          echo "Build Jenkins Docker Image Through Dockerfile"
          docker build . --tag cchen1103/jenkins
        '''
      }
    }
  }
  post {
    success {
      echo "Push docker image to dockerhub"
      sh '''
        docker push cchen1103/jenkins
      '''
    }
    failure {
      echo "Build docker image failed"
    }
  }
}
