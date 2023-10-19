*** Settings ***
Library           RequestsLibrary


*** Keywords ***
Get Prime JSON
    [Arguments]    ${num1}
    ${resp}=     GET    http://127.0.0.1:5000/next2/${num1}

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    [return]    ${resp.json()}


*** Test Cases ***
Test Prime Numbers 17 (ฺBefore Using Keywords)
    ${resp}=     GET    http://127.0.0.1:5000/next2/5
    Should Be Equal    ${resp.status_code}    ${200}
    ${json_resp}=    Set Variable  ${resp.json()}
    Should Be Equal    ${json_resp['msg']}    ${7}

Test Prime Numbers 36 (ฺBefore Using Keywords)
    ${resp}=     GET    http://127.0.0.1:5000/next2/5
    Should Be Equal    ${resp.status_code}    ${200}
    ${json_resp}=    Set Variable  ${resp.json()}
    Should Be Equal    ${json_resp['msg']}    -3

Test Prime Numbers 13219 (ฺBefore Using Keywords)
    ${resp}=     GET    http://127.0.0.1:5000/next2/3.5
    Should Be Equal    ${resp.status_code}    ${200}
    ${json_resp}=    Set Variable  ${resp.json()}
    Should Be Equal    ${json_resp['msg']}    5.5


Test Prime Numbers 17
    ${json_resp}=    Get Prime JSON    ${5}
    Should Be Equal    ${json_resp['msg']}    7

Test Prime Numbers 36
    ${json_resp}=    Get Prime JSON    ${-5}
    Should Be Equal    ${json_resp['msg']}    -3

Test Prime Numbers 13219
    ${json_resp}=    Get Prime JSON    ${3.5}
    Should Be Equal    ${json_resp['msg']}    5.5