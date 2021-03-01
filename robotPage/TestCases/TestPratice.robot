*** Settings ***
Resource  ../MultiPageKeywords/PK.robot
Resource  ../ResourceCommon/base.robot
Resource  ../ResourceCommon/Environment/Env.robot

Test Setup      Abrir navegador
Test Teardown   fechar navegador

*** Test Case ***
Caso de Teste 01: comprar produto
    Dado que eu tenha acessado a pagina
    e tenha escolhido um produto
    e feito um cadastro
    e validado o valor do produto
    então efetua a compra