import hudson.model.Result
import jenkins.model.CauseOfInterruption

build.getProject()._getRuns().iterator().each{ run ->
  def exec = run.getExecutor()
  //if the run is not a current build and it has executor (running) then stop it
  if( run!=build && exec!=null ){
    //prepare the cause of interruption
    def cause = { "interrupted by build #${build.getId()}" as String } as CauseOfInterruption
    exec.interrupt(Result.ABORTED, cause)
  }
}

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

        stage('Docker deploy'){
            steps {

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