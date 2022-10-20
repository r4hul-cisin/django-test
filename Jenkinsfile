pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'Pipeline started'
                sh '''
                    docker images
                    docker ps -a
                '''
            }
        }
    }
}