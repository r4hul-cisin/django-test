pipeline {
    agent any
    environment{
        DOCKER_USERNAME = '4495'
        IMAGE_NAME = 'django-test'
        IMAGE_TAG = '1.0'
        CONTAINER_NAME = 'django-test'
    }
    stages {
        stage('Build Docker Image') {
            steps {
                sh '''
                    echo "Pipeline started"
                    docker build . -t ${DOCKER_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}
                '''
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                        sh '''
                            docker login -u ${DOCKER_USERNAME} -p ${dockerhubpwd}
                            docker push ${DOCKER_USERNAME}/${IMAGE_NAME}
                        '''
                    }
                }
            }
        }
        stage('Clean Up') {
            steps {
                script {
                    sh '''
                        docker stop ${CONTAINER_NAME}
                        docker system prune -f

                    '''
                }
            }
        }
        stage('DeployToStaging') {
            steps {
                script {
                    sh '''
                        docker run --name ${IMAGE_NAME} -p 8000:8000 -d ${DOCKER_USERNAME}/${IMAGE_NAME}
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
                        # docker exec -it ${IMAGE_NAME} python manage.py test
                    ''' 
                }
            }
        }
    }
}