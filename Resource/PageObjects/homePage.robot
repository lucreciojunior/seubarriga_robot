*** Settings ***
Resource    ../Main.robot

*** Keywords ***
Então o sistema exibira a mensagem de sucesso do Login
    [Arguments]                   ${message}
    # ${Text}                       getMessage                ${validaMessage}
    # Should Be Equal As Strings    ${Text}                   ${message}
    Wait For Elements State    ${validaMessage}
    Get Text                   ${validaMessage}    equal      ${message}


Dado que o usuário clique em Adicionar contas
    click                         ${btnContas}
    Click                         ${btnAddConta}
    # clickText                     ${optionContas}            Adicionar
    # SelectClickValue    ${optionContas}    Adicionar
    Take Screenshot

Dado que o usuário clique em Listar contas
    click                         ${btnContas}
    clickIndex                    ${optionContas}             1
    Take Screenshot
Dado que o usuário clique em Criar Movimentação
    clickIndex                    ${btnMovimentacaoResumo}    2
    Take Screenshot

Dado que o usuario clique na opcao Resumo Mensal 
    clickIndex                    ${btnMovimentacaoResumo}    3
    Sleep    10s
    Take Screenshot