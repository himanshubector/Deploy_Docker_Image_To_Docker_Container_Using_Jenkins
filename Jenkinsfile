pipeline{
    agent any
    tools{
        maven 'maven_3_9_1'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/himanshubector/docker-jenkins-devops-automation']])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t dockerdevopsimage .'
                }
            }
        }
        stage('Push docker image to hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u himsb -p ${dockerhubpwd}'

}
                    sh 'docker push dockerdevopsimage'

                }
            }
        }
    }
}


// Declarative Jenkins Pipeline script

// Pipeline script from SCM - We are not keeping the script Global but instead keeping the script within the code