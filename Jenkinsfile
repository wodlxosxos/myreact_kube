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
                        DOCKERTAG = sh (script: "git log -n 1 --pretty=format:'%H'", returnStdout: true)
                        echo "${DOCKERTAG.substring(0, 7)}"
                        sh "git config user.email wodlxosxos73@gmail.com"
                        sh "git config user.name wodlxosxos"
      }
    }
  }
}
}
