*** Setting ***
Resource        ../common_include.robot
Resource        ../util.robot

Documentation       RF version 4.1.1


*** Keywords ***
# Get 请求  args->关键词参数
GetR
    [Arguments]     ${request_url}      &{args}
    ${resp}=    Get     ${request_url}      &{args}
    [Return]    ${resp}

#get_on_session_request
GetSR
    [Arguments]    ${http_session}   ${url}    &{args}
    ${resp}=    Get On Session      ${http_session}    ${url}      &{args}
    [Return]    ${resp}

#post_request
PostR
    [Arguments]     ${request_url}     &{args}
    ${resp}=    Post    ${request_url}      &{args}
    [Return]    ${resp}

#post_on_session_request
PostSR
    [Arguments]    ${http_session}   ${url}      &{args}
    ${resp}=    Post On Session      ${http_session}    ${url}      &{args}
    [Return]    ${resp}

# 上传文件
PostF
     [Arguments]     ${request_url}   ${file_field}     ${filepath}      &{args}
      ${file}=  Get File For Streaming Upload       ${filepath}
      ${files}=   Create Dictionary    ${file_field}=${file}
      ${resp}=      Post    ${request_url}     files=${files}       &{args}
      [Return]      ${resp}


# todo 可类似扩充其他方法
# todo 多次请求死亡处理, 重新发请求还是?
