pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Test run"'
                sh '''
                    echo "Test Multi line shell script"
                    ls -lah
                    pwd
                    whoami
                '''
            }
        }
    }
}