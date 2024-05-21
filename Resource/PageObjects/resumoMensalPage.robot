*** Settings ***
Resource    ../Main.robot

*** Keywords ***
Quando o usuario consultar as movimentações
    [Arguments]                                   ${mes}               ${ano}
    
    ${url_atual}                                  Get Url
    Should Be Equal As Strings                    ${urlResumo}         ${url_atual}
    Click    ${fieldMes}
    Run Keyword If     '${mes}' == 'Setembro'     SelectClickValue           ${fieldMes}          09
    Run Keyword If     '${ano}' == '2023'         SelectClickValue           ${fieldAno}          2023
    Take Screenshot
    click                                         ${btnBuscar}

Então o sistema exibira as movimentações pesquisadas
    Wait For Elements State                     ${validaMovimentacao}

Então o sistema o grid vazio
    Should Not Be Empty               ${validaMovimentacao}

