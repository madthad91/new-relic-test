call ./mvnw.cmd clean compile install
call docker build -t springio/gs-spring-boot-docker . 
call docker run -p 8081:8080 springio/gs-spring-boot-docker