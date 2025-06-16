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
                    sshagent(['jen-123']) {
                        sh"scp -o StrictHostkeyChecking=no deploy.sh ec2-user@3.85.202.240:/home/ec2-user/deploy.sh"
                        sh "ssh -o StrictHostkeyChecking=no ec2-user@3.85.202.240 'chmod +x /home/ec2-user/deploy.sh && /home/ec2-user/deploy.sh "
                    }
                }
            }
        }
    }
}
