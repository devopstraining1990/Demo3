FROM anjuna91/jenkins-docker
MAINTAINER Anjuna
RUN java -jar $WORKSPACE/target/*.jar &
CMD ["/usr/bin/java", "-jar", "-Dspring.profiles.active=default", "$WORKSPACE/target/*.jar"]
