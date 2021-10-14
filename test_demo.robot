*** Setting ***
Resource    api_lib/requets.robot
Resource    util.robot
Resource    db.robot
Resource    log.robot


*** Test Cases ***
testList
    ${params}=      create dictionary        page=1     limit=10
    ${headers}=     create dictionary       Auth=1234
    ${resp}=    getr    Supplier/suplier_list      params=${params}   headers=${headers}
    log    ${resp.json()}

#    ${content}=     Get val from dic    ${resp.json()}      data
#    log        ${content}
#
#    ${keys}=        get dictionary keys         ${content}
#    log         ${keys}
    Resp List Check     ${resp}

    #Status Should be    OK      ${resp}

#    request_method_check    ${resp.method}     GET

#    create session      api
#
#    ${resp1}=   get_on_session_request     api   /Supplier/suplier_list   ${params}     headers=${headers}
#    log_to_stdout      ${resp1}
#    log_to_error      sddasd ${resp1}

testAdd
    ${item1}=       create dictionary   s_no=t001  name=tom  c_number=17759513427
    ${resp}=    PostR    Supplier/add      json=${item1}
#    Run Keyword And Expect Error    HTTPError: 500*         Assert Ssb      OK      ${resp}
#    ${resp}=       Run Keyword And Expect Error    HTTPError: 500*
#    ...         PostR      Supplier/add      ${item1}
    Log     ${resp}


testUpload

    ${data}=    create dictionary       remark=123  uid=8   id=1    type=5
    Log To Error    ${data}

#    ${file}=  Get File For Streaming Upload  1.png
#    ${files}=   Create Dictionary   file=${file}
#    Log To Error    ${file}
#    ${resp}=      Post    Attachment/supplierAttachmentUpload     files=${files}     data=${data}

    ${resp}=      PostF       Attachment/supplierAttachmentUpload  file  1.png     data=${data}
    Log         ${resp.json()}

testdb
    Connect
    ${list}=        Query More       select * from ya_supplier
#    ${count}=   get length      ${list}
    ${count}=       Get Count       select * from ya_supplier
    Log To Std Error    ${count}
    Disconnect
    log to std error        ${list}

