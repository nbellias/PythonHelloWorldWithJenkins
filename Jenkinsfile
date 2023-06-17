pipeline {
    agent {
        dockerfile true
    }
    stages {
        stage('Prepare Environment') {
            steps {
                sh 'venv/bin/python hello-world/app.py'
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
