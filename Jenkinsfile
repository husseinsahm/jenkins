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

        stage('Terraform Deploy') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'aws-creds',
                    usernameVariable: 'AWS_ACCESS_KEY_ID',
                    passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                )]) {

                    sh '''
                        echo "AWS Credentials Loaded"

                        echo "=== Terraform Init ==="
                        terraform init

                        echo "=== Terraform Apply ==="
                        terraform apply -auto-approve -var "key_name=ahussein"

                        echo "=== Terraform Output ==="
                        terraform output
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "Infrastructure deployed successfully!"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}
