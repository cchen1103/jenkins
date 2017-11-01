pipeline {
  agent {
    node 'master'
  }
  stages {
    stage('Jenkins Docker Image Build') {
      steps {
        sh '''
          echo "\033[0;32;40mBuild Jenkins Docker Image Through Dockerfile\033[0m"
          docker build . --tag cchen1103/jenkins
        '''
      }
    }
  }
}
