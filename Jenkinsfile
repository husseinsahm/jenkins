pipeline {
    agent any

    parameters {
        choice(
            name: 'ACTION',
            choices: ['deploy', 'destroy'],
            description: 'Choose whether to deploy or destroy the infrastructure'
        )
    }

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
                sh '''
                    echo "=== Terraform Init ==="
                    terraform init
                '''
            }
        }

        stage('Terraform Deploy') {
            when { expression { params.ACTION == 'deploy' } }
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'aws-creds',
                    usernameVariable: 'AWS_ACCESS_KEY_ID',
                    passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                )]) {
                    sh '''
                        echo "=== Terraform Apply ==="
                        terraform apply -auto-approve -var "key_name=ahussein"

                        echo "=== Terraform Output ==="
                        terraform output
                    '''
                }
            }
        }

        stage('Terraform Destroy') {
            when { expression { params.ACTION == 'destroy' } }
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'aws-creds',
                    usernameVariable: 'AWS_ACCESS_KEY_ID',
                    passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                )]) {
                    sh '''
                        echo "=== Terraform Destroy ==="
                        terraform destroy -auto-approve -var "key_name=ahussein"
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}
