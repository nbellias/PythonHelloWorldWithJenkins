pipeline {
    agent {
        docker {
            image 'python:3.9-slim-buster' // Replace with your image details
            args '-u root' // Additional volume mappings if needed
        }
    }
    stages {
        stage('Setup') {
            steps {
                sh 'pip install -r requirements.txt' // Install dependencies from requirements.txt
            }
        }
        stage('Run Tests') {
            steps {
                sh 'pytest hello-world/' // Run the tests using pytest or your preferred test runner
            }
        }
        stage('Generate Reports') {
            steps {
                sh 'pytest --junitxml=result.xml' // Generate test reports in JUnit XML format
            }
            post {
                always {
                    junit 'result.xml' // Publish the test results
                }
            }
        }
    }
}
