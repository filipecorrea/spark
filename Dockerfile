FROM java:8

# Install Apache Maven
RUN apt-get update
RUN apt-get install -y maven

WORKDIR /code

# Add pom.xml and resolve project dependencies
ADD pom.xml /code/pom.xml
RUN ["mvn", "dependency:resolve"]
RUN ["mvn", "verify"]

# Adding source, compile and package into a fat jar
ADD src /code/src
RUN ["mvn", "package"]

EXPOSE 4567
CMD ["/usr/lib/jvm/java-8-openjdk-amd64/bin/java", "-jar", "target/spark-jar-with-dependencies.jar"]
