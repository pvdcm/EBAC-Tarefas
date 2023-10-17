# Como cliente da EBAC-SHOP
# Quero configurar meu produto de acordo com meu tamanho e gosto
# E escolher a quantidade
# Para depois inserir no carrinho


# Critérios de Aceitação:
# 1 – Seleções de cor, tamanho e quantidade devem ser obrigatórios
# 2 – Deve permitir apenas 10 produtos por venda
# 3 –Quando eu clicar no botão “limpar” deve voltar ao estado original


Feature: Configurar Produto
    Como cliente da EBAC-SHOP
    Quero configurar meu produto de acordo com meu tamanho e gosto
    E escolher a quantidade
    Para depois inserir no carrinho


    Background:
        Given Que eu acesse o EBAC-SHOP na página de um produto


    Scenario: Seleção e preenchimento de todos os campos
        When Eu selecionar os campos
        And preencher os campos de cor, tamanho e quantidade
        And Selecionar 10 ou menos produtos
        Then O produto deve ser adicionado ao carrinho
        And Eu devo ser notificado que o produto foi adicionado ao carrinho


    Scenario: Seleção e não preenchimento de todos os campos
        When Eu selecionar os campos
        But Não preencher um campo
        Or não preencher nenhum campo
        And Selecionar 10 ou menos produtos
        Then O produto não deve ser adicionado ao carrinho
        And Eu devo ser notificado sobre os campos obrigatórios


    Scenario: Seleção e preenchimento de todos os campos, mas exceder o limite de produtos
        When Eu selecionar os campos
        And Preencher os campos de cor, tamanho e quantidade
        But Selecionar mais de 10 produtos
        Then O produto não deve ser adicionado ao carrinho
        And Eu devo ser notificado que excedi o limite de produtos


    Scenario: Limpar campos
        When Eu clicar no botão "Limpar"
        Then Eu devo confirmar ou cancelar a ação
        Then O formulário/interface deve limpar todos os inputs/campos
        And Eu devo ser notificado que os inputs/campos foram limpos