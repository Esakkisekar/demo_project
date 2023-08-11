pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                script {
                    def mvnHome = tool name: 'Maven', type: 'maven'
                    def mavenCmd = "${M2_HOME:}/bin/mvn"
                    
                    sh "${mavenCmd} clean install"
                }
            }
        }
        
        stage('Docker Build') {
            steps {
                script {
                    def imageName = "hello-world-java"
                    def dockerfile = "Dockerfile"
                    
                    sh "docker build -t ${imageName} -f ${dockerfile} ."
                }
            }
        }
    }
}
