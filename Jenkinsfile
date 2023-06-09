pipeline {
    agent any
    
    tools {
        maven 'Maven 3.8.3'
        jdk 'jdk11'
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Docker Build and Push') {
            when {
                anyOf {
                    branch 'dev'
                    branch 'master'
                }
            }
            steps {
                script {
                    def app = docker.build("myapp:${env.BUILD_ID}") // Build the Docker image with a unique tag

                    if (env.BRANCH_NAME == 'dev') { // If on the dev branch, push to dev repository
                        app.push('raghavanp08/dev')
                    } else if (env.BRANCH_NAME == 'master') { // If on the master branch, push to prod repository
                        app.push('raghavanp08/prod')
                    }
                }
            }
        }
    }
}
