pipeline {
    agent any
    tools{
        maven 'Maven-3.9.5'
    } 
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Rahulplexcel/devops-automation']]])
                bat 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    bat 'docker build -t javatechie/devops-automation .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId:'dockerhubpwd',variable: 'dockerhubpwd')]) {
                   bat "docker login -u rahulnshanbhag -p Plexcel@123"

}
                   bat "docker push javatechie/devops-automation:1.0"
                }
            }
        }
        stage('Deploy to k8s'){
           steps{
                script{
                    kubernetesDeploy (configs: 'deploymentservice.yaml',kubeconfigId: 'k8sconfigpwd')
                }
            }
        } 
    }
}
