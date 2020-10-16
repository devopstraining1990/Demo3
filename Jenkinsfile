pipeline {
   agent any
	stages {
      stage('Git Checkout') {
         steps {
            git 'https://github.com/rshruti/parking_backend.git'
		}
	}
	stage('Build'){
            steps{
                sh '/opt/maven/bin/mvn clean verify -Dmaven.test.skip=true'                
            }
        }  
        
	stage ('Deploy') {
		steps {
			sh '/opt/maven/bin/mvn clean deploy -Dmaven.test.skip=true'
		}
	}
	stage ('Release') {
		steps {
			sh 'export JENKINS_NODE_COOKIE=dontkillme ;nohup java -jar $WORKSPACE/target/*.jar &'
		}
	}
		stage ('DB Migration') {
		steps {
			sh '/opt/maven/bin/mvn clean flyway:migrate'
		}
	}
}
}
