pipeline {
 environment {
  registry = "sabit12 / my-nginx"
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
     docker.build registry + ":$BUILD_NUMBER"
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
 }
}
