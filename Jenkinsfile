pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                sh '''
                    echo "Pipeline started"
                    docker build . -t 4495/django-test
                '''
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                        sh '''
                            docker login -u 4495 -p ${dockerhubpwd}
                            docker push 4495/django-test
                        '''
                    }
                }
            }
        }
        stage('Clean Up') {
            steps {
                script {
                    sh '''
                        docker stop django-test
                        docker system prune -f

                    '''
                }
            }
        }
        stage('DeployToStaging') {
            steps {
                script {
                    sh '''
                        docker run --name django-test -p 8000:8000 -d 4495/django-test
                        echo "running at http://localhost:8000"

                    '''
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh '''
                        echo "Testing Django application"
                        # docker exec -it django-test python manage.py test
                    ''' 
                }
            }
        }
    }
}