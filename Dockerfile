FROM  tomcat:9.0
EXPOSE 8081
ADD  ./target/*.war  \Program Files\Apache Software Foundation\Tomcat 9.0\webapps
WORKDIR C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps
CMD ["catalina.sh", "run"]
