#!/usr/bin/env sh

# echo $ACCESS_KEY
# echo $SECRET_ACCESS_KEY

if [ 0"$ACCESS_KEY" = "0" -o 0"$SECRET_ACCESS_KEY" = "0" ]
then
    echo "\$ACCESS_KEY or \$SECRET_ACCESS_KEY is empty ! "
else
    echo "Create AWS Credentials!"

	mkdir -p ~/.aws
	cd ~/.aws
	touch credentials

	echo "[default]" >> credentials
	echo "aws_access_key_id=$ACCESS_KEY" >> credentials
	echo "aws_secret_access_key=$SECRET_ACCESS_KEY" >> credentials

    cat ~/.aws/credentials
	cd ~
fi

java $JAVA_OPTS   -jar "/usr/local/springboot-ec2-0.0.1.jar"