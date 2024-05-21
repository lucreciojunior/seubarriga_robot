*** Settings ***
Resource    ../Main.robot

*** Keywords ***

Dado que o usuário clique em Novo Cadastro
    Wait For Elements State    ${fieldEmail}
    Take Screenshot
    Click                       ${btnNovoUsuarioCad}
                                     ${urlAtual}          Get Url
    Should Be Equal As Strings       ${urlAtual}          ${URL_cadastro}
    Take Screenshot
    Wait For Elements State    ${fieldNome}
    

Quando preencher os dados para o cadastro
    [Arguments]    ${nome}    ${email}    ${senha}
    # Fakers
    Run Keyword If    '${nome}' != 'None'     Fill Text    ${fieldNome}     ${nome}
    Run Keyword If    '${email}' != 'None'    Fill Text    ${fieldEmail}    ${email}
    Run Keyword If    '${senha}' != 'None'    Fill Text    ${fieldSenha}    ${senha}
    Take Screenshot
    Click                                           ${btnCadastrar}

Então o sistema exibira a mensagem 
    [Arguments]                   ${message}
    ${text}       getMessage      ${validaMessage}
    Should Be Equal As Strings    ${text}    ${message}


        



