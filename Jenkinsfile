pipeline {
    agent any

    stages {
        stage("Build and pushing") {
            steps {
                script {
                    echo 'Executing build-and-push.sh'
                    sh 'chmod +x build-and-push.sh'                              
                    sh "./build-and-push.sh ${env.BRANCH_NAME}"
                }
            }
        }

        stage("Deploy to EC2") {
            steps {
                script {
                    echo 'Deploying docker image to EC2'
                    def dockerCmd = "docker run -p 8080:8080 -d nginx:latest"
                    sshagent(['jen-123']) {
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@44. .144.104 ${dockerCmd}"
                    }
                }
            }
        }
    }
}

