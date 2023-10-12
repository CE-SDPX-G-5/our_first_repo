*** Settings ***
Library           RequestsLibrary


*** Keywords ***
Get Prime JSON
    [Arguments]    ${num1}
    ${resp}=     GET    http://127.0.0.1:5000/is_prime/${num1}

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    [return]    ${resp.json()}


*** Test Cases ***
Test Prime Numbers 17 (ฺBefore Using Keywords)
    ${resp}=     GET    http://127.0.0.1:5000/is_prime/17
    Should Be Equal    ${resp.status_code}    ${200}
    ${json_resp}=    Set Variable  ${resp.json()}
    Should Be Equal    ${json_resp['msg']}    True

Test Prime Numbers 36 (ฺBefore Using Keywords)
    ${resp}=     GET    http://127.0.0.1:5000/is_prime/36
    Should Be Equal    ${resp.status_code}    ${200}
    ${json_resp}=    Set Variable  ${resp.json()}
    Should Be Equal    ${json_resp['msg']}    False

Test Prime Numbers 13219 (ฺBefore Using Keywords)
    ${resp}=     GET    http://127.0.0.1:5000/is_prime/13219
    Should Be Equal    ${resp.status_code}    ${200}
    ${json_resp}=    Set Variable  ${resp.json()}
    Should Be Equal    ${json_resp['msg']}    True


Test Prime Numbers 17
    ${json_resp}=    Get Prime JSON    ${17}
    Should Be Equal    ${json_resp['msg']}    True

Test Prime Numbers 36
    ${json_resp}=    Get Prime JSON    ${36}
    Should Be Equal    ${json_resp['msg']}    False

Test Prime Numbers 13219
    ${json_resp}=    Get Prime JSON    ${13219}
    Should Be Equal    ${json_resp['msg']}    True