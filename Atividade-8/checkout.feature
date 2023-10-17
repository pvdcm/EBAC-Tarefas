# Como cliente da EBAC-SHOP
# Quero fazer concluir meu cadastro
# Para finalizar minha compra


# Critérios de Aceitação:
# 1 – Deve ser cadastrado com todos os dados obrigatórios, marcado com asteriscos
# 2 – Não deve permitir campo e-mail com formato inválido. Sistema deve inserir uma mensagem de erro
# 3 – Ao tentar cadastrar com campos vazios, deve exibir mensagem de alerta.


# Obs. Usar Tabela de exemplo de dados (Esquema do Cenário )


Feature: Configurar Produto
    Como cliente da EBAC-SHOP
    Quero fazer concluir meu cadastro
    Para finalizar minha compra


    Background:
        Given Que eu esteja na etapa de finalização da compra


    Scenario: Preenchimento de todos os campos obrigatórios
        When Eu preencher os campos obrigatórios
        And O campo de e-mail esteja preenchido corretamente/válido
        And Os campos estejam preenchidos
        And Eu clicar no botão 'FINALIZAR COMPRA'
        Then Eu devo poder finalizar a compra


    Scenario: Preenchimento do campos de e-mail
        When Eu preencher o campo de e-mail
        And O campo de e-mail esteja preenchido incorretamente/invalido
        And Eu clicar no botão 'FINALIZAR COMPRA'
        Then Eu não devo poder finalizar a compra
        Then Devo ser notificado com a mensagem: "E-mail inválido"
        And Os campos estejam preenchidos


    Scenario: Preenchimento inválidos dos campos obrigatórios
        When Eu não preencher o campo: <campo>
        And Eu clicar no botão 'FINALIZAR COMPRA'
        Then Eu não devo poder finalizar a compra
        And devo ser notificado com a devida mensagem: <mensagem>

        Examples:
            | Campo     | mensagem                                 |
            | e-mail    | "Campo e-mail não preenchido "           |
            | nome      | "Campo nome não preenchido "             |
            | sobrenome | "Campo sobrenome não preenchido "        |
            | país      | "Campo obrigatório país não preenchido " |
            | endereco  | "Campo endereço não preenchido "         |
            | cidade    | "Campo cidade não preenchido "           |
            | cep       | "Campo cep não preenchido "              |
            | telefone  | "Campo telefone não preenchido "         |