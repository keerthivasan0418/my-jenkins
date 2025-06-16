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
        stage("build"){
            steps{
            }
            post{
                success { emailext(subject:'Build Success: ${env.JOB_NAME}', to:'keerthivasanbmbk@gmail.com', body:'Build was successful.') }
                failure { emailext(subject:'Build Failure: ${env.JOB_NAME}', to:'keerthivasanbmbk@gmail.com', body:'Build failed.') }
            }
        }
        stage("Deploy to EC2") {
            steps {
                script {
                    echo 'Deploying docker image to EC2'                    
                    sshagent(['jen-123']) {
                        sh"scp -o stricthostkechecking=no ec2-user@3.85.202.240/home/ec2-user/deploy.sh"
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@3.85.202.240 'chmod+x deploy.sh && ./deploy.sh "
                    }
                }
            }
        }
    }
}
