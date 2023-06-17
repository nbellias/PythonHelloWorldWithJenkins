pipeline {
    agent {
        dockerfile true
    }
    stages {
        stage('SonarQube analysis') {
            steps {
                script {
                    // If you haven't defined SonarQube scanner in global tools, then you can add the path of sonar-scanner here.
                    def scannerHome = tool 'SonarQube Scanner 4.0'
                    withSonarQubeEnv('SonarQube') {
                        sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=your-python-repo -Dsonar.sources=. -Dsonar.host.url=http://your-sonarqube-server-url -Dsonar.login=your-sonarqube-token"
                    }
                }
            }
        }
        stage('Prepare Environment') {
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
