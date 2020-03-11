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
    echo "Hello New"
   }  
  }		
  stage('Building image') {
   steps{
    script {
     dockerImage = docker.build registry + ":$BUILD_NUMBER"
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
    sh "docker rmi $registry:$BUILD_NUMBER"
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
           sshagent(credentials : ['e64564d8-e7b1-4aa1-90d1-462f9c14c221']) {
            sh 'ssh -o StrictHostKeyChecking=no besolstechnologies@35.230.170.177 uptime'
            sh 'ssh -v besolstechnologies@35.230.170.177'
            sh 'scp /var/lib/jenkins/workspace/new-jenkins besolstechnologies@35.230.170.177:/startup'
            sh 'ssh -o StrictHostKeyChecking=no besolstechnologies@35.230.170.177 chmod +x startup/client-script.sh'
            sh 'ssh -o StrictHostKeyChecking=no besolstechnologies@35.230.170.177 startup/client-script.sh ${registry}:$BUILD_NUMBER'
        }
     
   }
  }
 }
}
