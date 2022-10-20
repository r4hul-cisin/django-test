pipeline {
    agent any
    environment {
    FILENAME = readFile '.env'
  }
    stages {
        stage('Build Docker Image') {
            steps {
                sh '''
                    echo "Pipeline started"
                    docker build . -t ${env.dockerhubUsername}/${env.appName}
                '''
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                        sh '''
                            docker login -u 4495 -p ${dockerhubpwd}
                            docker push ${env.dockerhubUsername}/${env.appName}
                        '''
                    }
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh '''
                        echo "Testing Django application"

                    ''' 
                }
            }
        }
        stage('Clean Up') {
            steps {
                script {
                    sh '''
                        docker stop ${env.appName}
                        docker system prune -f

                    '''
                }
            }
        }
        stage('DeployToProduction') {
            steps {
                script {
                    sh '''
                        docker run --name ${env.appName} -p 8000:8000 -d ${env.dockerhubUsername}/${env.appName}
                        echo "running at http://localhost:8000"

                    '''
                }
            }
        }
    }
}