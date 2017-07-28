node {
    stage ('Deploy') {
        git branch: 'master', url: 'git@github.com:patrickbaber/website.git'
        sh './jenkins/deploy.sh'
    }
}