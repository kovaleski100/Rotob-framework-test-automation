*** Settings ***
Documentation    Suite description
Resource  ../PageObjects/PO.robot

*** Keywords ***
Validar acesso
    PO.Valida Titulo

Buscar produto
    PO.Digitar elemento
    PO.Botão buscar

adicionar no carrinho
    PO.Conferir disponibilidade
    PO.Click add carinho
    PO.proceed to checkout

Fazer cadastro
    PO.cadastrar email
    PO.cadastrar informações

Validada preço
    PO.validar dados de entrega
    PO.validar preço

efetua compra
    PO.comprar