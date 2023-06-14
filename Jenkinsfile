pipeline {
    agent none
    stages {
        stage('Build'){
            agent {
                docker {
                    image 'python:2-alpine'
                }
            }
            steps {
                sh 'python hello-world/app.py'
            }
        }
        stage('Run Tests') {
            agent {
                docker {
                    image 'qnib/pytest'
                }
            }
            steps {
                sh 'pytest --verbose --junit-xml test-reports/results.xml hello-world/test_app.py'
            }
            post {
                always {
                    junit 'test-reports/results.xml'
                }
            }
        }
    }
}
