*** Settings ***
Resource    ../Main.robot


*** Keywords ***
Dado que o usuario informe os dados para o Login
    [Arguments]        ${email}    ${senha}
    Run Keyword If    '${email}' != 'None'    Fill Text    ${fieldEmail}    ${email}
    Run Keyword If    '${senha}' != 'None'    Fill Text    ${fieldSenha}    ${senha}
    Take Screenshot
    
Quando o usuario clicar no botão Entrar
    Click        ${btnEntrar}

Então o sistema exibira a mensagem de erro
    [Arguments]                   ${message}
    ${Text}                       getMessage     ${validaMessage}
    Should Be Equal As Strings    ${Text}        ${message}
    
