FROM java:8 
# Install maven
RUN apt-get update
RUN apt-get -y install  wget unzip
RUN apt-get install -y maven

RUN wget https://services.gradle.org/distributions/gradle-3.5-bin.zip

RUN mkdir /opt/gradle
RUN unzip -d /opt/gradle gradle-3.5-bin.zip

RUN export PATH=$PATH:/opt/gradle/gradle-3.5/bin

WORKDIR /code

# Prepare by downloading dependencies
ADD build.gradle /code/build.gradle

# Adding source, compile and package into a fat jar
ADD src /code/src
RUN ["gradle", "build"]
EXPOSE 8080
CMD ["/usr/lib/jvm/java-8-openjdk-amd64/bin/java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "build/libs/hello-world-app-gradle-0.0.1-SNAPSHOT.jar"]
