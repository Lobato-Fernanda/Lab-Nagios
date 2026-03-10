# Instalação do agente Windows (NSClient++)

Para monitorar a máquina Windows foi utilizado:

NSClient++

---

# Passo 1 — Acesso remoto

Conectar via RDP.

Baixar a chave PEM da instância e descriptografar a senha.

---

# Passo 2 — Desativar firewall

Desativar temporariamente o firewall do Windows para permitir testes de ping.

---

# Passo 3 — Download do agente

Baixar:

https://nsclient.org

---

# Passo 4 — Instalação

Durante a instalação:

habilitar

- NRPE Server
- Check Plugins

---

# Passo 5 — Configuração

Adicionar IP do servidor Nagios como host autorizado.

---

# Passo 6 — Reiniciar serviço

Após configuração reiniciar o serviço NSClient++.
