*** Setting ***
Resource    assert.robot
Resource    log.robot

*** Keywords ***
Get Val From Dic
    [Arguments]     ${kw}   ${key}      ${default}=${None}
    ${default}=     set variable    ${default}
    ${flag}     ${val}=     run keyword and ignore error   get from dictionary    ${kw}   ${key}
    ${ret}=     set variable if       '${flag}'=='PASS'       ${val}      ${default}
    [Return]       ${ret}

Get Resp Message
    [Arguments]     ${resp}     ${message_field}
    [Return]        ${resp.json()}[${message_field}]



Resp List Check
    [Arguments]     ${resp}
    [Documentation]     Response list check
    Assert Ssb      OK      ${resp}

    ${message}=     Get Resp Message     ${resp}        msg

    Log To Error        ${message}


    ${code}=      Set Variable      ${resp.json()}[code]
    Log          ${resp.json()}
    Log         ${code}
    Run Keyword If      '${code}'=='200'        Log To Error    ${code}

    ${params_keys}=     create list     list    count
    Log To Error         ${params_keys}

    ${ret_keys}=    Get Dictionary keys     ${resp.json()}[data]
    Log To Error        ${ret_keys}

    Assert List Equal     ${params_keys}     ${ret_keys}


#Resp Option Check
#    [Documentation]     Response check of the add or edit or delete and so on
#    [Arguments]     ${resp}     ${message}=''
#    Assert Ssb      OK      ${resp}
#    ${code}=       ${resp.json()}[code]
#    Run Keyword If      '${code}'!=200      Log To Error        ${message} ${resp.json()}[msg]


