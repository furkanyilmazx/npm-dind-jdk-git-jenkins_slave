#!/bin/bash
service docker start && sleep 5 && echo { \"storage-driver\" : \"vfs\" } >>  /etc/docker/daemon.json && service docker restart &&java -jar agent.jar -jnlpUrl http://192.168.0.34:8080/computer/npm/slave-agent.jnlp -secret 714536e0af8982b5514f9ac8bf9ecfa8756ea1310bb55f13f8deaa2dbf398930 -workDir "/home/fyx"
