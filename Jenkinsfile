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
         stage('Publish HTML Reports') {
            steps {
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/var/lib/jenkins/workspace/Finance-me project/target/surefire-reports', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
            }    
        }  
        stage('Create Docker Image') {
            steps {
                sh 'docker build -t amitg01/finance-me:1.0'
            }    
        }  
    }
}    
