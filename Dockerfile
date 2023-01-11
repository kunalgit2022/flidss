FROM jdk-16.0.1
EXPOSE 8081
ADD \WINDOWS\ServiceProfiles\LocalService\.m2\repository\com\sparc\flidss\0.0.1-SNAPSHOT\flidss-0.0.1-SNAPSHOT.war flidss-0.0.1-SNAPSHOT.war
ENTRYPOINT ["java","-jar","\flidss-0.0.1-SNAPSHOT.war]
