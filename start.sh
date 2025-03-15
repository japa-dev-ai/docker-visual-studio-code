#!/bin/bash

# Inicia o SSH Server
service ssh start

# Inicia o code-server
code-server --auth none --bind-addr 0.0.0.0:8080 /home/vscode &

# Mantém o contêiner em execução
tail -f /dev/null
