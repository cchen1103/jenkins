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
}
