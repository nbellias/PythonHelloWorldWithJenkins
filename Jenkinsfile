pipeline {
    agent {
        docker {
            image 'python:3.9.17-slim-bullseye'
            args '-v $HOME/.m2:/root/.m2'
        }
    }
    stages {
        stage('Prepare'){
            steps {
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
