FROM ubuntu:18.04


# This is in accordance to : https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-get-on-ubuntu-16-04
RUN apt-get update && \
	apt-get install -y openjdk-8-jdk && \
	apt-get install -y ant && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer;

# Fix certificate issues, found as of 
# https://bugs.launchpad.net/ubuntu/+source/ca-certificates-java/+bug/983302
RUN apt-get update && \
	apt-get install -y ca-certificates-java && \
	apt-get clean && \
	update-ca-certificates -f && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer;

# Setup JAVA_HOME, this is useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME


RUN apt-get update && apt-get install --yes curl
RUN apt-get update &&  apt-get install --yes gnupg && curl --silent --location https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update && apt-get install --yes nodejs && apt-get install --yes build-essential


RUN yes | apt update && yes | apt install apt-transport-https ca-certificates curl software-properties-common && \
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
	yes | add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" && \
	yes | apt update && \
	yes | apt install docker-ce

RUN apt-get update && apt-get install -y git openssh-server

COPY ./agent.jar /jenkins/agent.jar
RUN mkdir -p /home/fyx

WORKDIR /jenkins
COPY ./start.sh start.sh
ENTRYPOINT [ "./start.sh" ]
#ENTRYPOINT [ "java", "-jar", "agent.jar", "-jnlpUrl", "http://192.168.0.34:8080/computer/npm/slave-agent.jnlp", "-secret", "714536e0af8982b5514f9ac8bf9ecfa8756ea1310bb55f13f8deaa2dbf398930", "-workDir", "'/home/fyx'"] 

