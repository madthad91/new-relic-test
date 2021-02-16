FROM amazoncorretto:15.0.2-alpine
VOLUME /tmp
ARG JAR_FILE

# New Relic Metadata
ENV NRA_VERSION 4.4.0
ENV APP_NAME = demo1

# Setup new relic agent
RUN apk --update add curl unzip
RUN mkdir -p /opt
RUN curl -SL https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip -o /tmp/nr.zip && unzip /tmp/nr.zip -d /opt/ && rm /tmp/nr.zip
RUN mkdir -p /opt/newrelic/logs
RUN chmod 777 /opt/newrelic/logs

RUN cat /opt/newrelic/newrelic.yml | sed -e "s/<%= license_key %>/<YOUR_LICENSE_KEY_HERE>/" -e "s/app_name:.*/app_name: $APP_NAME/" > /opt/newrelic/newrelic.yml.new
RUN mv /opt/newrelic/newrelic.yml /opt/newrelic/newrelic.yml.default
RUN mv /opt/newrelic/newrelic.yml.new /opt/newrelic/newrelic.yml

ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT java -Djava.security.egd=file:/dev/./urandom -javaagent:/opt/newrelic/newrelic.jar -jar /app.jar