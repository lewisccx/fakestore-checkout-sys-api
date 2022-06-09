pipeline {
    agent any
    tools{
        maven 'M2_HOME'
    }
    stages {
     stage('Checkout'){
         steps{
            checkout([$class: 'GitSCM', 
            branches: [[name: '*/develop']], 
            extensions: [], 
            userRemoteConfigs: [[credentialsId: 'Github-credential', 
                                url: 'https://github.com/lewisccx/fakestore-checkout-sys-api.git']]])  
        }
     }
     stage('Build'){
         steps{
             bat 'mvn clean install -DskipTests'
         }
        
     }
     stage('Code Quality'){
         steps{
            withSonarQubeEnv('SonarQubeServer') {
                bat 'mvn sonar:sonar  -Dsonar.projectKey=fakestore-checkout-sys-api-pipeline -Dsonar.projectName=fakestore-checkout-sys-api-pipeline'
            }
         }
        
     }
     
     stage("Nexus Repo"){
         steps {
             nexusArtifactUploader artifacts: [[artifactId: 'fakestore-db-sapi-ccx', classifier: 'mule-application', file: 'fakestore-checkout-sys-api/target/fakestore-db-sapi-ccx-1.0.0-SNAPSHOT-mule-application.jar', type: 'jar']], credentialsId: 'nexus-sonatype-credential', groupId: 'com.mycompany', nexusUrl: 'localhost:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'cancer-hosted-snapshot', version: '1.0.0-SNAPSHOT'
         }
     }
     stage("Deployment"){
         steps{
            withCredentials([usernamePassword(credentialsId: 'viseo-anypoint-plaform-credential', passwordVariable: 'PASS', usernameVariable: 'USER'), usernamePassword(credentialsId: 'anypoint-platform', passwordVariable: 'clientSecret', usernameVariable: 'clientId')]) {
                bat 'mvn clean deploy -DmuleDeploy -DskipTests -Dmule.env=dev -Dmule.key=viseo -Dplatform.client_id=%clientId% -Dplatform.client_secret=%clientSecret% -Dmule.version=4.4.0 -Danypoint.username=%USER% -Danypoint.password=%PASS% -Druntime.env=SANDBOX -Druntime.appname=fakestore-checkout-sys-api-pipeline -Druntime.vCore=Micro -Druntime.workers=1 -Druntime.region=ap-southeast-1'
            }
         }
     }
    }
}
