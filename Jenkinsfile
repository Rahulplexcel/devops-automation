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
                    bat 'docker build -t javatechie/devops-integration .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId:'dockerhubpwd',variable: 'dockerhubpwd')]) {
                   bat "docker login -u rahulnshanbhag -p ${dockerhubpwd}"

}
                   bat "docker tag  javatechie/devops-integration:latest rahulnshanbhag/devops-integration:myfirstpush"
                   bat "docker push rahulnshanbhag/devops-integration:myfirstpush"
                }
            }
        }
        /* stage('Deploy to k8s'){
           steps{
                script{
                    kubernetesDeploy (configs: 'deploymentservice.yaml',kubeconfigId: 'k8sconfigpwd')
                }
            }
        } */
    }
}
