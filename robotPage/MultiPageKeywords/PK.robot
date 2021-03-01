*** Settings ***
Documentation    Suite description
Resource        ../PageAction/PA.robot

*** Keywords ***
Dado que eu tenha acessado a pagina
    PA.Validar acesso

e tenha escolhido um produto
    PA.Buscar produto
    PA.adicionar no carrinho

e feito um cadastro
    PA.Fazer cadastro

e validado o valor do produto
    PA.Validada preço

então efetua a compra
    PA.efetua compra