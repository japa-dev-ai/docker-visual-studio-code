# Usar uma imagem oficial do Ubuntu 22.04
FROM ubuntu:22.04

# Definir o ambiente como não interativo para evitar prompts
ENV DEBIAN_FRONTEND=noninteractive


# Atualiza pacotes e instala SSH, Python 3.11 e dependências
RUN apt-get update -y && apt-get install -y \
    openssh-server \
    python3.11 \
    python3-pip \
    sudo \
    curl \
    && apt-get clean

# Garante que o SSH está rodando
RUN mkdir -p /run/sshd

# Definir o usuário e senha
ENV USERNAME=usr_vscode
ENV PASSWORD=1234

# Criar o usuário e configurar a senha
RUN useradd -m -s /bin/bash $USERNAME && \
    echo "$USERNAME:$PASSWORD" | chpasswd && \
    usermod -aG sudo $USERNAME

# Cria diretório SSH e define permissões corretas
RUN mkdir -p /home/$USERNAME/.ssh
RUN chmod 700 /home/$USERNAME/.ssh
RUN chown $USERNAME:$USERNAME /home/$USERNAME/.ssh

# Adiciona chave pública ao authorized_keys
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkN8blfuBHEMSMjiMW51FY7XDlWJRmNSPu\
NxBH40T5JARPrV3Sj2ogaS3dV6lNIwRKfxiCKcZRm1QQq+e8PfceC3G0OvSBaLxV\
p9lQRLF9bv++Qk512oX1d9iQFbCjcWuTwSvBQ+zdkDF/TI6h6SkpyPyuYe0PUJ7q\
YyHt0tBMqEZ5DeKaWZm5oUWAaShEwr+HaARfVyg5LCh0MmQ9MUF7ocLVFXEKvqhb\
r/eJHfbpJ+LVN7V8tAljWFHdGDeQeLnqH+SSfoCAb8S4Kkpfds3VyWbh5ppTafCE\
vOpj8Vh/hsJD97ieSchbK6tvguanWY3LjHwt5afgT7A4f5Y9FfmV" > /home/$USERNAME/.ssh/authorized_keys
RUN chmod 600 /home/$USERNAME/.ssh/authorized_keys
RUN chown $USERNAME:$USERNAME /home/$USERNAME/.ssh/authorized_keys

# Instalar o VS Code Server
RUN mkdir -p /home/$USERNAME/.vscode-server && \
    chown -R $USERNAME:$USERNAME /home/$USERNAME/.vscode-server

# USER $USERNAME
# WORKDIR /home/$USERNAME

# Baixa e instala o code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh
# Expõe as portas necessárias
EXPOSE 8080 22

WORKDIR /home/$USERNAME

# Copia um script de inicialização
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Define o script de inicialização como entrypoint
ENTRYPOINT ["/start.sh"]