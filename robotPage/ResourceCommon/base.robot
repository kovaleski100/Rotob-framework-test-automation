*** Settings ***
Library     Selenium2Library
Documentation       Suite description

*** Keywords ***
Abrir Navegador
    Open Browser        ${url}     ${browser}
    Maximize Browser Window

fechar navegador
    Close Browser