# Base image with Tomcat 9 and Java 17
FROM tomcat:9.0-jdk17

# Remove default web apps from Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file as ROOT.war so it runs at root URL
COPY target/JSPLoginApp.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat when the container runs
CMD ["catalina.sh", "run"]
