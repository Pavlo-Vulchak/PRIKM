pipeline {
    agent any

    stages {
        stage('Start') {
            steps {
                echo 'Lab_3: started by GitHub'
            }
        }

        stage('Image build') {
            steps {
                sh "docker build -t prikm:latest ."
                sh "docker tag prikm vulchakpavlo/prikm:latest"
                sh "docker tag prikm vulchakpavlo/prikm:$BUILD_NUMBER"
            }
        }

        stage('Push to registry') {
            steps {
                withDockerRegistry([ credentialsId: "dockerhub_token", url: "" ])
                {
                    sh "docker push vulchakpavlo/prikm:latest"
                    sh "docker push vulchakpavlo/prikm:$BUILD_NUMBER"
                }
            }
        }

        stage('Deploy image'){
            steps{
                sh "docker stop \$(docker ps -q) || true"
                sh "docker container prune --force"
                sh "docker image prune --force"
                //sh "docker rmi \$(docker images -q) || true"
                sh "docker run -d -p 80:80 vulchakpavlo/prikm"

            }
        }
    }

    post {
        success {
            script {
                // Send Telegram notification on success
                telegramSend message: "Build successful", chatId: "723523723"
            }
        }
    }
}