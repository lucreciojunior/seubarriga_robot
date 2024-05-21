*** Settings ***
Resource    ../Main.robot


*** Keywords ***
Quando preencher os dados
    [Arguments]    ${tipomov}    ${dataMov}    ${dataPag}
    ...    ${descricao}    ${interessado}    ${valor}    ${situacao}
    Fakers
    click              ${tipo}

    # Wait For Elements State    id=tipo    visible

    Run Keyword If    '${tipomov}' == 'Receita'        SelectClickValue   ${tipo}        REC             
    Run Keyword If    '${tipomov}' == 'Despesa'        clickIndex    ${tiposMovimento}             1
    Run Keyword If    '${dataMov}' != 'Null'           set           ${fieldDataMov}        ${dataMov}
    Run Keyword If    '${dataPag}' != 'Null'           set           ${fieldDAtaPag}        ${dataPag}
    Run Keyword If    '${descricao}' != 'Null'         set           ${fieldDescricao}      ${FakerDescricao}
    Run Keyword If    '${interessado}' != 'Null'       set           ${fieldInteressado}    ${FakeNome}
    Run Keyword If    '${valor}' != 'Null'             set           ${fieldValor}          ${FakerValor}
    click              ${fieldConta}
    SelectClickValue   ${fieldConta}    2097534
    Run Keyword If    '${situacao}' == 'Pago'          click         ${statusPago}
    Run Keyword If    '${situacao}' == 'Pendente'      click         ${statusPendente}
    Take Screenshot
    click              ${btnSalvar}

Então o sistema exibirar a mensagem 
    [Arguments]    ${message}
    ${text}        getMessage     ${validaMessage}
    Should Be Equal As Strings    ${text}    ${message}

Então o sistema exibirar as mensagens 
    [Arguments]    ${message}     ${message1}
    ${text}     getTextIndex      ${validaMessage1}    0
    Should Be Equal As Strings    ${text}    ${message}
    ${text1}    getTextIndex      ${validaMessage1}    1
    Should Be Equal As Strings    ${text1}    ${message1}


    