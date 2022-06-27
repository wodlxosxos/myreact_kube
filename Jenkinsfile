pipeline {
    agent any
    environment {
        DIRECTORY = ""
    }
    stages {
        stage('Clone repository') {
            steps {
                checkout scm
                script {
                    env.BRANCH_NAME = sh (script: "git rev-parse --abbrev-ref HEAD", returnStdout: true)
                }
            }
        }
        stage('Update GIT') {
            steps{
                script {
                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                        withCredentials([usernamePassword(credentialsId: 'testgithub', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                            //def encodedPassword = URLEncoder.encode("$GIT_PASSWORD",'UTF-8')
                            env.GIT_COMMIT_SHORT = sh (script: "git log -n 1 --pretty=format:'%H'", returnStdout: true)
                            env.GIT_COMMIT_SHORT = env.GIT_COMMIT_SHORT.substring(0,7)
                            
                            echo "branch = ${env.BRANCH_NAME}"
                            echo "branch2 = ${env.GIT_BRANCH.split("/")[1]}"
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
                build job: 'update-test', parameters: [string(name: 'DIRECTORY', value: "${DIRECTORY}")]
            }
        }
    }
}
