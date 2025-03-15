### **Criando uma imagem Docker: Visual Studio Code Server**

A imagem Docker **Visual Studio Code Server** é uma solução pronta para uso que permite rodar o **Visual Studio Code** em um ambiente remoto, acessível via navegador ou pelo cliente VS Code local. Baseada no projeto **code-server**, essa imagem é ideal para desenvolvedores que desejam ter um ambiente de desenvolvimento completo e personalizável em qualquer lugar, sem a necessidade de instalação local do VS Code.

Com suporte a extensões, terminal integrado e acesso a arquivos locais, o **Visual Studio Code Server** oferece uma experiência de desenvolvimento rica e familiar, diretamente no navegador.

---

![image](https://github.com/user-attachments/assets/124b257a-196c-498e-94cc-98262ac10c7f)

---
### **Recursos Principais**
- **Ambiente de Desenvolvimento Remoto**: Acesse o Visual Studio Code de qualquer dispositivo com um navegador.
- **Suporte a Extensões**: Instale e use extensões do VS Code diretamente no servidor.
- **Terminal Integrado**: Execute comandos do shell diretamente na interface do code-server.
- **Persistência de Dados**: Armazena configurações e arquivos em volumes Docker para garantir que nada seja perdido ao reiniciar o contêiner.
- **Acesso via SSH**: Configuração opcional de um servidor SSH para acesso remoto ao contêiner.
- **Personalizável**: Adapte o ambiente de desenvolvimento às suas necessidades com configurações e extensões.

---

### **Como Usar**

### **Clonar o repositório do GitHub**
```bash
# Abrir uma japela do cmd.
git clone https://github.com/japa-dev-ai/docker-visual-studio-code.git
```

#### **2. Executar o Contêiner**
Para rodar o contêiner com o Visual Studio Code Server, use o seguinte comando:

```bash
cd docker-visual-studio-code

docker-compose up --build -d
```

#### **2. Acessar o code-server**
Abra o navegador e acesse:
```
http://localhost:8080
```

Insira a senha definida no comando `docker run` (1234 do exemplo) para acessar o ambiente de desenvolvimento.

---

### **Configurações Adicionais**

#### **Habilitar SSH**
Se você configurou o SSH Server na imagem, pode acessar o contêiner via SSH:

```bash
ssh usr_vscode@localhost -p 2222
```

#### **Persistência de Dados**
Os dados do code-server (extensões, configurações e arquivos) são armazenados no volume `code-server-data`. Para backup ou migração, basta copiar o volume.

#### **Personalização**
- Adicione extensões diretamente na interface do code-server.
- Configure o ambiente de desenvolvimento com arquivos de configuração do VS Code (`.vscode/settings.json`).

---

### **Dockerfile**

O Dockerfile usado para construir a imagem está disponível no repositório. Ele inclui:
- Instalação do **code-server**.
- Configuração do **SSH Server** (opcional).
- Definição de um usuário não-root (`usr_vscode`) para operações seguras.

---

### **Links Úteis**
- [Repositório Oficial do code-server](https://github.com/coder/code-server)
- [Documentação do Docker](https://docs.docker.com/)
- [Visual Studio Code Marketplace](https://marketplace.visualstudio.com/vscode)

---

### **Por que Usar Esta Imagem?**
- **Portabilidade**: Execute o VS Code em qualquer lugar, sem instalação local.
- **Facilidade de Uso**: Configuração rápida e simples com Docker.
- **Segurança**: Acesso protegido por senha e suporte a SSH.
- **Flexibilidade**: Personalize o ambiente de desenvolvimento conforme suas necessidades.

---

### **Pronto para Começar?**
Clone o repositório, construa a imagem e comece a desenvolver com o Visual Studio Code Server hoje mesmo!

---

