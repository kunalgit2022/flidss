FROM jdk-16.0.1
EXPOSE 8081
ADD target/flidss-0.0.1-SNAPSHOT.war flidss-0.0.1-SNAPSHOT.war
ENTRYPOINT ["java","-jar","/flidss-0.0.1-SNAPSHOT.war]
