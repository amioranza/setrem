FROM jenkins/jenkins:alpine
USER root
RUN apk add ca-certificates
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN for i in $(cat /usr/share/jenkins/ref/plugins.txt|grep -v ^#) ; do echo "########## Installing $i ############"; /usr/local/bin/install-plugins.sh $i; done
RUN chown 1000:1000 /var/jenkins_home -R
RUN apk add --no-cache tzdata
ENV TZ America/Sao_Paulo