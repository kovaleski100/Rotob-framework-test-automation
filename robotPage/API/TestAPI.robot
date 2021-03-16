*** Settings ***
Resource        ../ResourceCommon/base.robot
Suite Setup          conectar a API

*** Test Cases ***
Buscar cart
    busca shopping_card
    conferir code status        200
    conferir produtos