pipeline {
 environment {
  registry = "sabit12/my-nginx"
  registryCredential = "dockerhub"
  dockerImage = ''
 }
 agent any
 stages {	
  stage('Test stage') {
   steps {
    echo "Hello New Checked v1"
   }  
  }		
  stage('Building image') {
   steps{
    script {
     dockerImage = docker.build registry + ":latest"
    }
   }
  }
  stage('Deploy Image') {
   steps{
    script {
     docker.withRegistry( '', registryCredential ) {
      dockerImage.push()
     }
    }
   }
  }
  stage('Remove Unused docker image') {
   steps{
    sh "docker rmi $registry:latest"
   }
  }
  stage('Final Comments') {
   steps {
    echo "All clear"
   }  
  }
  stage('Deploy') {
   steps {
    echo "****************Deploy***************"
    sshagent(credentials : ['client']) {
     sh 'ssh -o StrictHostKeyChecking=no besolstechnologies@35.236.252.223 uptime'
     sh 'ssh -v besolstechnologies@35.236.252.223'
     sh 'scp /var/lib/jenkins/workspace/github-jenkins-dockers/* besolstechnologies@35.236.252.223:/home/besolstechnologies/'
     sh 'ssh -o StrictHostKeyChecking=no besolstechnologies@35.236.252.223 chmod +x client-script.sh'
     sh 'ssh -o StrictHostKeyChecking=no besolstechnologies@35.236.252.223 bash client-script.sh'
    }
   }
  }
 }
}
