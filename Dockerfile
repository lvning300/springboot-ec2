FROM openjdk:8u171-alpine3.8

COPY entrypoint.sh /usr/bin
COPY target/springboot-ec2-0.0.1.jar /usr/local

RUN chmod a+x /usr/bin/entrypoint.sh \
    && echo "http://mirrors.aliyun.com/alpine/v3.8/main/" > /etc/apk/repositories \
    && echo "https://mirrors.aliyun.com/alpine/v3.8/community/" >> /etc/apk/repositories \
    && apk update \
    && apk add --no-cache \
    && apk add tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

EXPOSE 9000
ENTRYPOINT ["/usr/bin/entrypoint.sh"]

