pipeline {
    agent {
        dockerfile true
    }
    stages {
        sstage('Prepare Environment') {
            steps {
                // Use ShiningPanda plugin to setup Python virtual environment
                sh 'source venv/bin/activate'
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
