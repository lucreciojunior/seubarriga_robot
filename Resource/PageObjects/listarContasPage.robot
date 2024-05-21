*** Settings ***
Resource    ../Main.robot

*** Keywords ***
Então sera visualizado a mensagem
    [Arguments]                   ${message}
    ${text}                       getMessage            ${validaMessage}
    Should Be Equal As Strings    ${text}               ${message}

Quando o usuário verificar a tela
    ${urlAtual}   Get Url
    Should Be Equal As Strings    ${urlListarContas}    ${urlAtual}
    Take Screenshot
Então o sistema exibira as contas cadastradas
    Wait For Elements State     ${tabelaContas}

E clicar em Editar
    clickIndex                    ${editarConta}         1


Quando o usuário clicar em Excluir a Conta desejada
    Take Screenshot
    clickIndex                    ${excluirConta}         15