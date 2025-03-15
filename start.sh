#!/bin/bash

# Inicia o SSH Server
service ssh start

# Inicia o code-server
code-server --auth none --bind-addr 0.0.0.0:8080 /home/vscode &

# Mantém o contêiner em execução
tail -f /dev/null


  git config --global user.email "angelo.matsui@outlook.com"
  git config --global user.name "japa-dev-ai"