pipeline {
    agent {
        docker {
            image 'python:3.8-slim-buster'
        }
    }
    stages {
        stage('Prepare Environment') {
            steps {
                // Use ShiningPanda plugin to setup Python virtual environment
                sh 'pip install virtualenv'
                sh 'virtualenv venv'
                sh 'source venv/bin/activate'
                sh 'pip install -r requirements.txt'
                sh 'python hello-world/app.py'
            }
        }
        stage('Run Tests') {
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
