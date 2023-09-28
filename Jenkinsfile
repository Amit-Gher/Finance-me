pipeline {
    agent any
    tools {
      maven 'M2_HOME'
          }
    environment {
        AWS_ACCESS_KEY_ID = 'AWS_ACCESS_KEY_ID'
        AWS_SECRET_ACCESS_KEY = 'AWS_SECRET_ACCESS_KEY'
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
         stage('Docker Image Push') {
            steps {
                
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u amitg01 -p ${dockerhubpwd}'
                    }    
                    sh 'docker push amitg01/finance-me:1.0'  
           }     
        }
        stage('Configure Server with Terraform'){
            steps {
                    dir('my-serverfiles'){
                     sh 'sudo chmod 600 Insure-me.pem'
                     sh 'terraform init'
                     sh 'terraform validate'
                     sh 'terraform apply --auto-approve'
                    }
            }
        }     
    }
}    
