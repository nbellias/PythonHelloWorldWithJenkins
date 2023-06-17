pipeline {
    agent {
        docker {
            image 'python:2-alpine'
        }
    }
    stages {
        stage('Build'){
            steps {
                sh 'python hello-world/app.py'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'pip install -r requirements.txt'
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
