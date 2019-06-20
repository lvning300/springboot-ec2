node {
    def app
    def mvnHome

    stage('Preparation') {
          echo "第一步设置基础环境git,maven"
          git 'https://github.com/lvning300/springboot-ec2.git'
          mvnHome = tool 'M3'
       }

     stage('Build') {
          // Run the maven build
          echo "第二步maven构建"
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
        echo "第三步Docker构建"
        app = docker.build("local/springboot-ec2")

    }

    stage('Build Tag') {
        echo "第四步Docker打标签"
        /* This builds the actual image; synonymous to
         * docker build on the command line */
       sh "docker tag  local/springboot-ec2:latest springboot-ec2:latest"


    }
    stage('Push image') {
     echo "第四步推送镜像"
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://297669174308.dkr.ecr.cn-northwest-1.amazonaws.com.cn', 'ecr:cn-northwest-1:aws_ecr_credentials') {
            app.push("springboot-ec2")
            app.push("latest")
        }
    }
}