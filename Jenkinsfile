#!/usr/bin/env groovy

pipeline {
    agent { docker { image 'golang' } }
    stages {
        stage('build') {
            steps {
                echo "Build Starting"
                sh 'build.sh'
            }
        }
        stage('deploy') {
            when {
              expression {
                currentBuild.result == null || currentBuild.result == 'SUCCESS' 
              }
            }
            steps {
                echo "Deploy Starting"
                sh 'deploy.sh'
            }
        }
    }
}