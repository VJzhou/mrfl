*** Setting ***
Resource        common_include.robot
Library         string

*** Keywords ***
#todo 可做成配置项
Get ConnectConfig
    ${config}=      Create List       database='erp'  user='root'  password='Inno@2017'  host='192.168.1.168'  port=3306
    ${config_str}=      Evaluate       ",".join(${config})
    ${type}=      Get DbDrive
    Log      ${type}
    [Return]      ${type}       ${config_str}

Get DbDrive
    [Return]    pymysql

Connect
    ${type}     ${config}=      Get ConnectConfig
    Connect To Database Using Custom Params     ${type}      ${config}

Disconnect
    Disconnect From Database

Query Sql
    [Arguments]     ${sql}
    @{ret}=   query      ${sql}
    [Return]     ${ret}

Query One
    [Arguments]     ${sql}
    @{ret}=     Query Sql       ${sql}
    [Return]     @{ret[0]}

Query More
    [Arguments]     ${sql}
    @{list}=        Query Sql       ${sql}
    [Return]    @{list}

Query Count
    [Arguments]     ${sql}
    ${count}=       Row Count       ${sql}
    [Return]    ${count}

Delete All Rows
    [Arguments]     ${table_name}
    Delete All Rows From Table      ${table_name}

Assert Row Equal
    [Arguments]     ${sql}      ${except_val}
    Row Count Is Equal To X       ${sql}    ${except_val}

Assert Row GT
    [Arguments]     ${sql}      ${except_val}
    Row Count Is Greater Than X       ${sql}    ${except_val}

Assert Row LT
    [Arguments]     ${sql}      ${except_val}
    Row Count Is Less Than X       ${sql}    ${except_val}