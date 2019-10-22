pipeline {
    agent {
        docker {
            image 'node:6-alpine'
            args '-p 3000:3000 -p 5000:5000'
        }
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                bat 'npm install'
            }
        }
        stage('Test') {
            steps {
                bat './jenkins/scripts/test.bat'
            }
        }
        stage('Deliver for development') {
            when {
                branch 'development'
            }
            steps {
                bat './jenkins/scripts/deliver-for-development.bat'
                input message: 'Finibated using the web site? (Click "Proceed" to continue)'
                bat './jenkins/scripts/kill.bat'
            }
        }
        stage('Deploy for production') {
            when {
                branch 'production'
            }
            steps {
                bat './jenkins/scripts/deploy-for-production.bat'
                input message: 'Finibated using the web site? (Click "Proceed" to continue)'
                bat './jenkins/scripts/kill.bat'
            }
        }
    }
}
