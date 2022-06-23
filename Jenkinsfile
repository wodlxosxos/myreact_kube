node {
    def app

    stage('Clone repository') {
      

        checkout scm
    }

    stage('Update GIT') {
            script {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    withCredentials([usernamePassword(credentialsId: 'testgithub', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                        //def encodedPassword = URLEncoder.encode("$GIT_PASSWORD",'UTF-8')
                        env.GIT_COMMIT_SHORT = sh (script: "git log -n 1 --pretty=format:'%H'", returnStdout: true)
                        env.GIT_COMMIT_SHORT = env.GIT_COMMIT_SHORT.substring(0,7)
                        DIRECTORY = "dev"
                        if (env.BRANCH_NAME == "master") {
                            DIRECTORY = "master"
                        }
                        echo "branch = ${DIRECTORY}"
                        echo "${DIRECTORY}"
                        echo "${env.GIT_COMMIT_SHORT}"
                        sh "git config user.email wodlxosxos73@gmail.com"
                        sh "git config user.name wodlxosxos"
      }
    }
  }
}
}
