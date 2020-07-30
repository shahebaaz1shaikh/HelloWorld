node{
	stage('Scm Checkout'){
	git 'https://github.com/shahebaaz1shaikh/HelloWorld'
	}
	stage('Mvn Package'){
	def mvnHome = tool name: 'maven-3', type: 'maven'
	def mvnCMD = "${mvnHome}/bin/mvn"
	sh label: '', script: "${mvnCMD} clean package"
	}
	stage('SonarQube Analysis') {
        def mvnHome =  tool name: 'maven-3', type: 'maven'
        withSonarQubeEnv('sonar-6') { 
          sh "${mvnHome}/bin/mvn sonar:sonar"
 	}
 	}
	stage('Build docker image'){
	sh 'docker build -t shahebaaz/sparkjava-hello-world-1.0 .'
	}
	stage('Push Docker Image'){
	   withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
	      sh "docker login -u shahebaaz -p ${dockerHubPwd}"    
	}
	sh 'docker push shahebaaz/sparkjava-hello-world-1.0'
	}
	stage('Run Container on Dev server'){
	def dockerRun = "docker run -p 8080:8080 -d ---name helloworld shahebaaz/sparkjava-hello-world-1.0"
	sshagent(['dev-server']) {
	sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.61.119 ${dockerRun}"
	}
	}
	
}
