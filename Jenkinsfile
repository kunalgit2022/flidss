pipeline {

    agent any

    tools {

     maven 'maven'

     }
    stages {
        stage('Git_Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/kunalgit2022/flidss.git'
            }
        }

	stage('Build_artifact') {

	   steps {

	        sh " mvn clean install package "

	     }

	   }

	stage('Build') {

	steps{
             sh "docker build . -t kunalsahoodocker/flidss"

	  }
	}

	stage('image_push') {

	steps {

	    withCredentials([usernamePassword(credentialsId: 'Dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){

            sh "docker login -u ${env.USERNAME} -p ${env.PASSWORD}"

            sh "docker push  kunalsahoodocker/flidss"

	 }
	
	}
       
       }
        
       stage('deploy') {

       steps{

           sh " docker run -d -p 8000:8080 kunalsahoodocker/flidss "

           }
	}
    }
}

