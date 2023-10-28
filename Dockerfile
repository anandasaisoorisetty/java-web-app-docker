FROM tomcat:8.0.20-jre8
# Dummy text to test 
COPY target/java-web-app*.war /usr/local/tomcat/webapps/java-web-app.war

# # Use Nginx as the base image
# FROM nginx:latest

# # Remove the default Nginx configuration file
# RUN rm /etc/nginx/conf.d/default.conf

# # Copy your Java web application files to the Nginx web root directory
# COPY target/java-web-app*.war /usr/share/nginx/html/java-web-app.war

# # Rename the WAR file to ROOT.war to serve it as the default application
# RUN mv /usr/share/nginx/html/java-web-app.war /usr/share/nginx/html/ROOT.war
