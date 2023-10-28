pipeline {
    agent any

    stages {
        stage('Cleanup WorkSpace') {
            steps {
                cleanWs()
            }
        }
        stage('Checkout from SCM') {
            steps {
               git url: 'https://github.com/anandasaisoorisetty/java-web-app-docker.git',branch: 'master'
            }
        }   
        stage("Maven Clean Package"){
            steps {
                script {
                    def mavenHome = tool name: "Maven", type: "maven"
                    def mavenCMD = "${mavenHome}/bin/mvn"
                    sh "${mavenCMD} clean package "
                }
            }
        }
         stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh "docker build -t anandasaisoorisetty/java-web-app-docker:Java-Project-${BUILD_NUMBER} ."
                }
            }
        }

        stage('Docker Login and Push Image to Docker Hub') {
            steps {
                script {
                    // Build Docker image
                    sh "docker push  anandasaisoorisetty/java-web-app-docker:Java-Project-${BUILD_NUMBER} "
                }
            }
        }
    }
}