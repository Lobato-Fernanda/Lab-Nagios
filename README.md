# Nagios Core Monitoring Lab

Autor: Fernanda Lobato  

Este repositório apresenta um laboratório prático de **monitoramento de infraestrutura utilizando Nagios Core**.
O objetivo do laboratório foi configurar um servidor Nagios capaz de monitorar:
- Servidores Linux
- Máquinas Windows
- Conectividade de rede

---

# Infraestrutura do Laboratório
Foram utilizadas **3 máquinas monitoradas + 1 servidor de monitoramento**.
| Máquina | Sistema | Função |
|------|------|------|
Nagios Server | Linux | Servidor de monitoramento |
Máquina 1 | Linux | Host monitorado |
Máquina 2 | Windows | Host monitorado |
Máquina 3 | Linux | Host monitorado |

---

# Ambiente
As máquinas foram criadas em instâncias com as seguintes configurações:
| Sistema | Tipo de Instância |
|------|------|
Linux | t2.small |
Windows | t3.large |

Configurações importantes:

- todas com **key pair (vockey)**
- mesmo **security group**
- comunicação entre as instâncias habilitada

---

# Arquitetura do Monitoramento
         +------------------+
         |   Nagios Server  |
         |    (Linux)       |
         +--------+---------+
                  |
     ------------------------------
     |             |             |
     +-----------+ +-----------+ +-----------+
    | Linux 1 | | Windows | | Linux 3 |
    | NRPE | | NSClient++| | NRPE |
    +-----------+ +-----------+ +-----------+

---

# Instalação do Nagios Core
A instalação foi realizada a partir do **código fonte do Nagios Core**.
Versão utilizada: Nagios 4.4.14
Script disponível em: install-nagios-server.sh

---

# Criação de Usuário e Grupo
O Nagios roda em um usuário próprio: nagios
Grupo: nagios
E o usuário do Apache foi adicionado ao grupo: www-data

---

# Interface Web
Após instalação, o Nagios pode ser acessado via navegador: http://IP-DO-SERVIDOR/nagios

Credenciais criadas: 
Usuário: nagiosadmin
Senha: senac123

---

# Monitoramento de Hosts

Para coletar dados dos servidores utilizamos:
| Sistema | Agente |
|------|------|
Linux | NRPE |
Windows | NSClient++ |

---
#Configuração dos Hosts

Os hosts monitorados foram configurados no arquivo: hosts-lab.cfg
Local no servidor: /usr/local/nagios/etc/objects/

---

# Testes realizados
Testes de conectividade entre instâncias:
ping linux1
ping linux3
ping windows

---

# Resultado

O Nagios passou a monitorar:

- Máquina Linux 1
- Máquina Linux 3
- Máquina Windows 2

Mostrando:

- status de hosts
- disponibilidade
- resposta de rede

---

# Observação
Este laboratório foi desenvolvido **exclusivamente para fins educacionais em segurança da informação e administração de sistemas**.

---

# Tecnologias Utilizadas

- Nagios Core
- NRPE
- NSClient++
- Linux
- Windows
- Apache
- AWS EC2








     
