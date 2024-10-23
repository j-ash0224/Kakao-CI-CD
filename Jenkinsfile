pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // GitHub에서 소스 코드를 가져오는 단계
                git branch: 'main', url: 'https://github.com/j-ash0224/Kakao-CI-CD'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Docker 이미지를 빌드하는 단계
                script {
                    dockerImage = docker.build('4-team.kr-central-2.kcr.dev/xeat-registry/my-express-app:latest')
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                // Docker 이미지를 컨테이너 레지스트리에 푸시하는 단계
                script {
                    docker.withRegistry('https://4-team.kr-central-2.kcr.dev', 'docker-credentials') {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                // Kubernetes에 배포하는 단계
                script {
                    kubernetesDeploy(
                        configs: 'k8s/deployment.yaml,k8s/service.yaml', // 쿠버네티스 배포 매니페스트 경로
                        kubeconfigId: '4a90f85a-1833-46b7-b19e-adbf9487867b'
                    )
                }
            }
        }
    }
}
