*** Settings ***
Resource    ../Main.robot

*** Keywords ***
Quando preencher o campo Nome
    [Arguments]                   ${conta}
    ${urlAtual}                   Get Url
    Should Be Equal As Strings    ${urlAtual}           ${urlAddContas}
    ${CompNome}                   FakerLibrary.First Name
    ${FakeNome}                   Catenate    Teste     ${CompNome}
    Run Keyword If    '${conta}' != 'Null'    set       ${fieldNome}    ${FakeNome}
    Take Screenshot 
    click                         ${btnSalvar}



