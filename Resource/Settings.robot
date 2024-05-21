*** Settings ***
Resource    ./Main.robot

Library    Browser

*** Keywords ***
Start Automation
    New Browser        browser=chromium    headless=True
    New Page           ${URL}
    Fakers
    # Maximize Browser Window+

    
Stop Automation
    Take Screenshot
    

Start Automation Login
    Fakers
    Start Automation
    Dado que o usuario informe os dados para o Login    teste@teste.com    123456
    Quando o usuario clicar no botão Entrar
    Então o sistema exibira a mensagem de sucesso do Login    Bem vindo, thiago!