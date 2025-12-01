pipeline {
    agent any

    environment {
        AWS_REGION = "eu-west-1"
    }

    stages {

        stage('Checkout Repo') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/husseinsahm/jenkins.git'
            }
        }

        stage('Setup AWS Credentials') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'aws-creds',
                    usernameVariable: 'AWS_ACCESS_KEY_ID',
                    passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                )]) {
                    sh 'echo "AWS Credentials Loaded"'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve -var "key_name=ahussein"'
            }
        }

        stage('Show Output') {
            steps {
                sh 'terraform output'
            }
        }
    }
}
