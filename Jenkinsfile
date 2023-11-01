pipeline {
    agent any

    stages {
        stage('Checkout from SCM') {
            steps {
               git url: 'https://github.com/anandasaisoorisetty/java-web-app-docker.git',branch: 'main'
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
        // stage('EKS Deploy') {
        //     steps {
        //         sh '''
        //             aws eks update-kubeconfig --name demo --region us-east-1
        //             sed "s/buildNumber/${BUILD_NUMBER}/g" deploy.yml > deploy-new.yml
        //             kubectl apply -f deploy-new.yml
        //             kubectl apply -f svc.yml
        //         '''
        //     }
        // }
         stage('ecs deploy') {
            steps {
                 sh '''
                 chmod +x changebuildnumber.sh
               ./changebuildnumber.sh $BUILD_NUMBER
	             sh -x ecs-auto.sh
                '''
            }    
        }
    }
}
