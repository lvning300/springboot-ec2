node {
    def app
    def mvnHome
    stage('Preparation') { // for display purposes
          // Get some code from a GitHub repository
          git 'https://github.com/lvning300/springboot-ec2.git'
          // Get the Maven tool.
          // ** NOTE: This 'M3' Maven tool must be configured
          // **       in the global configuration.
          mvnHome = tool 'M3'
       }

     stage('Build') {
          // Run the maven build
          withEnv(["MVN_HOME=$mvnHome"]) {
             if (isUnix()) {
                sh '"$MVN_HOME/bin/mvn" -Dmaven.test.failure.ignore clean package'
             } else {
                bat(/"%MVN_HOME%\bin\mvn" -Dmaven.test.failure.ignore clean package/)
             }
          }
       }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("local/springboot-ec2")

    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
       sh "docker tag  local/springboot-ec2:latest 297669174308.dkr.ecr.cn-northwest-1.amazonaws.com.cn/springboot-ec2:latest"


    }


    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://297669174308.dkr.ecr.cn-northwest-1.amazonaws.com.cn', 'ecr:cn-northwest-1:aws_ecr_credentials') {
            app.push("local/springboot-ec2")
            app.push("latest")
        }
    }
}