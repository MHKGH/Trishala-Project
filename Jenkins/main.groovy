pipeline {
    agent any

    parameters {
        string(name: 'GIT_REPO', defaultValue: 'https://github.com/MHKGH/Trishala_pom_files.git', description: 'Git repository URL')
        string(name: 'AWS_ACCOUNT_ID', defaultValue: '471448381908', description: 'AWS Account ID')
        string(name: 'AWS_REGION', defaultValue: 'ap-south-1', description: 'AWS region')
        string(name: 'ECR_REPO', defaultValue: 'dev-app-repo', description: 'ECR repository name')
        string(name: 'IMAGE_TAG', defaultValue: "${env.BUILD_NUMBER}", description: 'Docker image tag')
        string(name: 'dir', defaultValue: "java-mvn-springbootapp-master", description: 'pom.xml and docker files contain folder')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: "${params.GIT_REPO}"
            }
        }

        stage('Build Jar') {
            steps {
                dir(params.dir) {
                sh 'mvn clean package -DskipTests'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                dir(params.dir) {
                sh """
                    docker build -t ${params.ECR_REPO}:${params.IMAGE_TAG} .
                    docker tag ${params.ECR_REPO}:${params.IMAGE_TAG} ${params.AWS_ACCOUNT_ID}.dkr.ecr.${params.AWS_REGION}.amazonaws.com/${params.ECR_REPO}:${params.IMAGE_TAG}
                """
                }
            }
        }

        stage('Login to ECR & Push Image') {
            steps {
                sh """
                    aws ecr get-login-password --region ${params.AWS_REGION} \
                    | docker login --username AWS --password-stdin ${params.AWS_ACCOUNT_ID}.dkr.ecr.${params.AWS_REGION}.amazonaws.com

                    docker push ${params.AWS_ACCOUNT_ID}.dkr.ecr.${params.AWS_REGION}.amazonaws.com/${params.ECR_REPO}:${params.IMAGE_TAG}
                """
            }
        }
    }

    post {
        success {
            echo "✅ Docker image pushed to ECR: ${params.ECR_REPO}:${params.IMAGE_TAG}"
        }
        failure {
            echo "❌ Build or Push failed. Please check logs."
        }
    }
}
