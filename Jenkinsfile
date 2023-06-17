pipeline {
    agent {
        dockerfile true
    }
    stages {
        stage('Clone sources') {
            steps {
                git branch: 'main', url: 'https://github.com/nbellias/PythonHelloWorldWithJenkins.git'
            }
        }
        stage('SonarQube analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'sonar-scanner -Dsonar.sources=.'
                }
            }
        }
        stage("Quality gate") {
            steps {
                waitForQualityGate abortPipeline: true
            }
        }
        stage('Prepare'){
            steps {
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
