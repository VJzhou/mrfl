*** Setting ***
Documentation       日志keyword

*** Keywords ***
Log To Stdout
    [Arguments]     ${var}
    Print Stream     ${var}      stdout   false

Log To Std Error
    [Arguments]     ${var}
    Print Stream     ${var}      stderr   false

Print Stream
    [Arguments]     ${print}      ${stream}   ${is_new_line}
    log to console      ${print}      ${stream}   ${is_new_line}

Log Debug
    [Arguments]     ${message}
    Log     ${message}      DEBUG   html=true

Log Warn
    [Arguments]     ${message}
    Log     ${message}      WARN

Log Error
    [Arguments]     ${message}
    Log     ${message}      ERROR

Log Info
    [Arguments]     ${message}
    Log     ${message}      INFO