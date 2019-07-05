1)
create "eliteinvice" database
run WEB-INF/sql/eliteinvoice.sql

2)
main/resources/datasource-context.xml
update db username, password.

3) 
mvn clean tomcat7:run -e
http://localhost:7070
