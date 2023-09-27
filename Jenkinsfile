pipeline {
    agent any
    tools {
      maven 'M2_HOME'
          }
    stages {
        stage('Git Checkout'){
            steps {
              git 'https://github.com/Amit-Gher/Finance-me.git'
            }
        }    
        stage('Build Package') {
            steps {
                sh 'mvn clean package'
            }    
        }  
        stage('Create Docker Image') {
            steps {
                sh 'docker build -t amitg01/finance-me:1.0 .'
            }    
        }  
    }
}    
