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

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }

        stage('Show Output') {
            steps {
                sh 'terraform output'
            }
        }

    }

    post {
        success {
            echo "Infrastructure created successfully!"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}
