pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'Pipeline started'
                sh '''
                    echo "$USER"
                    docker images
                '''
            }
        }
    }
}