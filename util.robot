*** Setting ***
Resource    assert.robot
Resource    log.robot

*** Keywords ***
# 根据key获取val, default 为默认值
Get Val From Dic
    [Arguments]     ${kw}   ${key}      ${default}=${None}
    ${default}=     set variable    ${default}
    ${flag}     ${val}=     run keyword and ignore error   get from dictionary    ${kw}   ${key}
    ${ret}=     set variable if       '${flag}'=='PASS'       ${val}      ${default}
    [Return]       ${ret}

# 获取返回的信息
Get Resp Message
    [Arguments]     ${resp}     ${message_field}
    [Return]        ${resp.json()}[${message_field}]

# 列表类数据返回接口检查
Resp List Check
    [Arguments]     ${resp}     ${log_message}=${EMPTY}
    [Documentation]     列表类接口返回值检查, 可根据自己需求修改
    Assert Ssb      OK      ${resp}
    ${code}=      Set Variable      ${resp.json()}[code]
    Run Keyword If      '${code}'!='200'        Log Error    ${log_message}

# 非列表数据返回接口检查
Resp Option Check
    [Documentation]     检查添加 编辑 删除 禁用 恢复等类似接口返回值, 可按照自己需要修改
       ...  具体结构:  {
       ...                   "code" : 200,
       ...                   "message" : "xxxxxx",
       ...                   "data" : ""
       ...            }
    [Arguments]     ${resp}     ${message}=${EMPTY}
    Assert Ssb      OK      ${resp}
    ${code}=       Set Variable     ${resp.json()}[code]
    Log To Std Error    ${code}
    Run Keyword If      '${code}'!='200'      Log Error     ${message}${resp.json()}[msg]



