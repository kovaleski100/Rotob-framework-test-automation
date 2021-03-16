*** Settings ***
Library     Selenium2Library
Library               Collections
Library               RequestsLibrary
Documentation       Suite description

*** Variables ***
${URL_API}      http://5d9cc58566d00400145c9ed4.mockapi.io/
${resposta}

*** Keywords ***
Abrir Navegador
    Open Browser        ${url}     ${browser}
    Maximize Browser Window

fechar navegador
    Close Browser

conectar a API
    Create Session      API      ${URL_API}

busca shopping_card
    ${resposta}     Get On Session        API     shopping_cart
    Set Global Variable     ${resposta}
    log     ${resposta.text}

conferir code status
    [Arguments]     ${status_code}
    Should Be Equal As Strings      ${resposta.status_code}     ${status_code}

conferir produtos
    Dictionary Should Contain Item      ${resposta.json()}      shopping_cart     1
    Dictionary Should Contain Item      ${resposta.json()}      sku     ['demo_2', 'demo_1', 'demo_7']
    Dictionary Should Contain Item      ${resposta.json()}      color     ['Black', 'Orange', 'Yellow']
    Dictionary Should Contain Item      ${resposta.json()}      size     ['S', 'S', 'S']
    Dictionary Should Contain Item      ${resposta.json()}      price     ['27.00', '16.51', '16.40']
    Dictionary Should Contain Item      ${resposta.json()}      total_shipping     2.00