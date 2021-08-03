pipeline {
    agent any

    stages {

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

        stage('deploy on production'){
              when{
                    expression{ env.GIT_BRANCH =='origin/production'}
                  }

            steps {

                     sh 'docker stop $(docker ps --filter expose=8082-8082/tcp -q)'
                     sh 'docker run -itd -p 8082:8082 vaibhavnerle/docker-jenkins-aws:${BUILD_NUMBER}'
            }
        }

        stage('deploy on master'){

         when{
                expression{ env.GIT_BRANCH =='origin/master'}
              }
                    steps {

                            sh 'docker stop $(docker ps --filter expose=8081-8081/tcp -q)'
                            sh 'docker run -itd -p  8081:8081 vaibhavnerle/docker-jenkins-aws:${BUILD_NUMBER}'
                          }
            }


        stage('Archiving') {
            steps {
                 archiveArtifacts '**/target/*.jar'
            }

        }
    }
}
