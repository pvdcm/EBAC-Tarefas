# Como cliente da EBAC-SHOP
# Quero fazer o login (autenticação) na plataforma
# Para visualizar meus pedidos


# Critérios de Aceitação:
# 1 – Ao inserir dados válidos deve ser direcionado para a tela de checkout
# 2 – Ao inserir um dos campos inválidos deve exibir uma mensagem de alerta “Usuário ou senha inválidos”


Feature: Autenticação de login
    Como cliente da EBAC-SHOP
    Quero fazer o login (autenticação) na plataforma
    Para visualizar meus pedidos


    Background:
        Given que eu acesse a página de autenticação do portal EBAC


    Scenario: Preenchimento dos campos com dados válidos.
        When Eu entrar na página de Login
        And Preencher os campos de login
        And Clicar no botão de "Login"
        Then Eu devo ser direcionado para a tela de checkout
        And Eu devo poder visualizar meus pedidos


    Scenario: Preenchimento dos campos com dados inválidos.
        When Eu entrar na página de Login
        And Preencher os campos de login
        And Clicar no botão de "Login"
        Then Eu devo permanecer na página de login
        And ser notificado com a mensagem "Usuário ou senha inválidos"