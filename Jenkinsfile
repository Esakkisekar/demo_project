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
            def mavenCmd = "${env.M2_HOME}/bin/mvn"
            
            try {
                sh "${mavenCmd} clean install"
            } catch (Exception e) {
                currentBuild.result = 'FAILURE'
                error("Build failed: ${e.message}")
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
