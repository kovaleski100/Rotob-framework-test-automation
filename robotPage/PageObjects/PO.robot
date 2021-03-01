*** Settings ***
Documentation    Suite description

*** Keywords ***
Valida titulo
    Title should be     My Store

Digitar elemento
    Input Text      xpath://*[@id="search_query_top"]       ${produto}

Botão buscar
    Click Element       xpath://*[@id="searchbox"]/button

Conferir disponibilidade
    Wait Until Page Contains Element       xpath://*[@id="center_column"]/ul/li/div/div[2]/span/span   timeout=10
    Set Focus To Element       xpath://*[@id="center_column"]/ul/li/div/div[2]/span/span
    Mouse Over      xpath://*[@id="center_column"]/ul/li/div/div[2]/span/span
    Element Text Should Be     xpath://*[@id="center_column"]/ul/li/div/div[2]/span/span  In stock

click add carinho
    Mouse Over      xpath://*[@id="center_column"]/ul/li/div/div[2]/span/span
    Click Element       xpath://*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]

proceed to checkout
    Wait Until Page Contains Element       xpath://*[@id="layer_cart"]/div[1]/div[2]/div[4]/a   timeout=10
    wait Until Element Is Visible       xpath://*[@id="layer_cart"]/div[1]/div[2]/div[4]/a
    Wait Until Element Is Enabled       xpath://*[@id="layer_cart"]/div[1]/div[2]/div[4]/a
    Click Element       xpath://*[@id="layer_cart"]/div[1]/div[2]/div[4]/a
    Set Global Variable     ${productValue}
    ${productValue}     Get Text      xpath://*[@id="total_price"]
    Click Element       xpath://*[@id="center_column"]/p[2]/a[1]

cadastrar email
    Input Text      id:email_create       ${email}
    Click Element       id:SubmitCreate

cadastrar informações
    Wait Until Page Contains Element       name:id_gender   timeout=20
    Select Radio Button     id_gender       1
    Input Text      id:customer_firstname     ${name}
    Input Text      id:customer_lastname     ${lastname}
    Input Text      id:email        ${email}
    Input Text      id:passwd       ${password}
    Input Text      id:address1     ${address}
    Input Text      id:city     ${city}
    Set Focus To Element        xpath://*[@id="id_state"]
    Wait Until Page Contains Element       id:id_state   timeout=10
    Wait Until Element Is Enabled       id:id_state     timeout=10
    Sleep       5
    Select From List By Value       id:id_state     1
    Wait Until Element Is Enabled       id:postcode
    wait Until Element Is Visible       id:postcode
    Set Focus To Element        id:postcode
    Input Text      id:postcode     ${postalCode}
    Input Text      id:phone_mobile     ${phone}
    Input Text      id:alias     ${email2}
    Click Element       id:submitAccount

validar dados de entrega
    Element Text Should Be      xpath://*[@id="address_delivery"]/li[2]       matheus kovaleski
    Element Text Should Be      xpath://*[@id="address_delivery"]/li[3]       ${address}
    Element Text Should Be      xpath://*[@id="address_delivery"]/li[4]       Alvorada, Alabama 35242
    Element Text Should Be      xpath://*[@id="address_delivery"]/li[5]       United States
    Element Text Should Be      xpath://*[@id="address_delivery"]/li[6]       ${phone}
    Click Element       xpath://*[@id="center_column"]/form/p/button
    Click Element       xpath://*[@id="form"]/div/p[2]/label
    Click Element       xpath://*[@id="form"]/p/button

validar preço
    Element Text Should Be      xpath://*[@id="total_price"]        $19.25

comprar
    Click Element       xpath://*[@id="HOOK_PAYMENT"]/div[1]/div/p/a
    Click Element       xpath://*[@id="cart_navigation"]/button
    Title should be     Order confirmation - My Store