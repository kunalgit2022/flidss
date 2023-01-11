FROM jdk-16.0.1
EXPOSE 8081
ADD *.war /C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\flidss-0.0.1-SNAPSHOT.war
ENTRYPOINT ["java","-jar","\flidss-0.0.1-SNAPSHOT.war]
