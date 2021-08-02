stage('deploy on production'){
              when{
                    expression{ env.GIT_BRANCH =='origin/production'}
                  }

            steps {
                     sh 'docker stop $(docker ps --filter expose=8082-8082/tcp -q)'
                     sh 'docker run -itd -p  8082:8082 vaibhavnerle/docker-jenkins-aws:${BUILD_NUMBER}'
            }
        }

        stage('deploy on master'){
         when{
                expression{ env.GIT_BRANCH =='origin/master'}
              }
                    steps {
                            echo 'pulling ..'+ env.GIT_BRANCH
                            sh 'docker stop $(docker ps --filter expose=8081-8081/tcp -q)'
                            sh 'docker run -itd -p  8081:8081 vaibhavnerle/docker-jenkins-aws:${BUILD_NUMBER}'
                          }

        }
