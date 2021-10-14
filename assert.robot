*** Setting ***
Documentation        断言


*** Keywords ***
Assert Ssb
    [Arguments]     ${status_code}      ${resp}
    Status Should be    ${status_code}       ${resp}

Assert Dic Equal
    [Arguments]     ${dic}      ${adic}
    Dictionaries Should be Equal    ${dic}     ${adic}

Assert List Equal
    [Arguments]     ${list}     ${list2}
    [Documentation]     key 相等即个数相等
    Sort List   ${list}
    Sort List   ${list2}
    Lists Should be Equal       ${list}     ${list2}

Assert String Equal
    [Arguments]     ${s1}     ${s2}     &{args}
    Should Be Equal As Strings      ${s1}       ${s2}       &{args}

Assert Dic Contain One
    [Arguments]     ${dic}     ${val}      &{args}
    Dictionary Should Contain Item      ${dic}      ${val}      &{args}