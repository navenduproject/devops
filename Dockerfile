FROM tomcat
RUN rm -fr /usr/local/tomcat/webapps/ROOT
COPY target/MvnApp.war /usr/local/tomcat/webapps/ROOT.war
