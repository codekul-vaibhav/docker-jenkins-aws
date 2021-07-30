// @NonCPS
// def cancelPreviousBuilds() {
//     def jobName = env.JOB_NAME
//     def buildNumber = env.BUILD_NUMBER.toInteger()
//     /* Get job name */
//     def currentJob = Jenkins.instance.getItemByFullName(jobName)
//
//     /* Iterating over the builds for specific job */
//     for (def build : currentJob.builds) {
//         def exec = build.getExecutor()
//         /* If there is a build that is currently running and it's not current build */
//         if (build.isBuilding() && build.number.toInteger() != buildNumber && exec != null) {
//             /* Then stop it */
//             exec.interrupt(
//                     Result.ABORTED,
//                     new CauseOfInterruption.UserInterruption("Aborted by #${currentBuild.number}")
//                 )
//             println("Aborted previously running build #${build.number}")
//         }
//     }
// }
pipeline {
    agent any

    stages {
//         stage('Init') {
//             agent { label 'master' }
//             steps {
//                 script {
//                     cancelPreviousBuilds()
//                 }
//             }
//         }
        stage('deploy') {
            steps {
                sh "mvn package"
            }
        }

        stage('Build Docker image'){
            steps {

                sh 'docker build -t  vaibhavnerle/docker-jenkins-aws:${BUILD_NUMBER} .'
            }
        }

        stage('Docker Login'){

            steps {
                 withCredentials([string(credentialsId: 'vaibhavnerle', variable: 'Dockerpwd')]) {
                    sh "docker login -u vaibhavnerle -p ${Dockerpwd}"
                }
            }
        }

        stage('Docker Push'){
            steps {
                sh 'docker push vaibhavnerle/docker-jenkins-aws:${BUILD_NUMBER}'
            }
        }

        stage('Docker deploy'){
            steps {
                sh 'docker stop $(docker ps -a -q --filter ancestor=vaibhavnerle/docker-jenkins-aws:34 --format="{{.ID}}")'
                sh 'docker run -itd -p  8081:8080 vaibhavnerle/docker-jenkins-aws:${BUILD_NUMBER}'
            }
        }


        stage('Archving') {
            steps {
                 archiveArtifacts '**/target/*.jar'
            }
        }
    }
}