pipeline {
  agent {
    node {
      label 'master'
      ansiColor('xterm')
  }
  stages {
    stage('Jenkins Docker Image Build') {
      steps {
        sh '''
          echo "\u001B[0;32;40mBuild Jenkins Docker Image Through Dockerfile\u001B[0m"
          docker build . --tag cchen1103/jenkins
        '''
      }
    }
  }
}
