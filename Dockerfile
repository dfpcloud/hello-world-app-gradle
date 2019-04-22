FROM alpine:3.9
USER root

RUN apk add --update \
    curl \
    openjdk8=8.201.08-r1 \
 && rm /var/cache/apk/* \
 && echo "securerandom.source=file:/dev/urandom" >> /usr/lib/jvm/default-jvm/jre/lib/security/java.security

#insatll gradle
RUN apk add gradle

WORKDIR /code

# Prepare by downloading dependencies
ADD build.gradle /code/build.gradle

# Adding source, compile and package into a fat jar
ADD src /code/src
RUN ["gradle", "build"]

ADD ./build/libs/*.jar app.jar

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
