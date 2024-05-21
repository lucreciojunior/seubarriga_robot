*** Settings ***
Resource    ./Main.robot

Library    Collections

*** Keywords ***
waitElement
    [Arguments]                      ${elements}       ${time}
    Wait For Elements State          ${elements}       timeout=${time}
    # Wait Until Element Is Visible    ${elements}       ${time}

SelectClickValue
    [Arguments]                   ${elements}             ${value}
    Wait For Elements State       ${elements}
    Select Options By             ${elements}    value    ${value}
clickIndex
    [Arguments]                      ${element}        ${index}
    ${elements}=    Get Elements     ${element}
    ${element}=     Set Variable     ${elements}[${index}]
    Click                            ${element}

clickElement
    [Arguments]                      ${element}

    waitElement                      ${element}        10s
    Click                            ${element}

clickText
    [Arguments]                      ${element}        ${text}
    waitElement                      ${element}        10s
    ${text}                          Get Text          ${element}
    Click                            ${element}     

getMessage
    [Arguments]                          ${element}        
    waitElement                          ${element}    10s       
    ${text}=           Get Text          ${element}
    RETURN                               ${text} 
   

getTextIndex
    [Arguments]                      ${element}        ${index}
    ${elements}=    Get Elements     ${element}
    ${element}=     Set Variable     ${elements}[${index}]
    ${text}=                         Get Text          ${element}
    RETURN                           ${text}

set
    [Arguments]                      ${element}        ${text}
    waitElement                      ${element}        10s
    Fill Text                        ${element}        ${text}

clear
    [Arguments]                      ${element}
    waitElement                      ${element}        10s
    Clear Text                       ${element}    

