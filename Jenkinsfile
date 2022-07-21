pipeline {
    agent any
    stages {
        stage('Clone repository') {
            steps {
                checkout scm
                script {
                    env.BRANCH_NAME = env.GIT_BRANCH.split("/")[1]
                    if (env.BRANCH_NAME == 'develop') {
                        env.DIRECTORY = "dev"
                    } else {
                        env.DIRECTORY = "prod"
                    }
                }
            }
        }
        stage('Update GIT') {
            steps{
                script {
                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                        withCredentials([usernamePassword(credentialsId: 'testgithub', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                            //def encodedPassword = URLEncoder.encode("$GIT_PASSWORD",'UTF-8')
                            env.GIT_COMMIT_SHORT = sh (script: "git log -n 2 --pretty=format:'%H'", returnStdout: true)
                            echo "${env.GIT_COMMIT_SHORT}"
                            env.GIT_COMMIT_SHORT = env.GIT_COMMIT_SHORT.split("\n")[1]
                            env.GIT_COMMIT_SHORT = env.GIT_COMMIT_SHORT.substring(0,7)
                            echo "####################################################"
                            echo "${env.GIT_COMMIT_SHORT}"
                            
                            sh "git config user.email wodlxosxos73@gmail.com"
                            sh "git config user.name wodlxosxos"
                        }
                    }
                }
            }
        }
        stage('Trigger Manifest') {
            steps {
                build job: 'update-test', parameters: [string(name: 'DIRECTORY', value: env.DIRECTORY)]
            }
        }
    }
}
