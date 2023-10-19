*** Settings ***
Library           RequestsLibrary

*** Keywords ***
Get next2 JSON
    [Arguments]    ${x}
    ${resp} =     GET    http://127.0.0.1:5000/next2/${x}
    Should Be Equal    ${resp.status_code}    ${200}
    [return]    ${resp.json()}

*** Test Case ***
Test N7
    ${json_resp}=    Get next2 JSON    ${7}
    Should Be Equal    ${json_resp['mrg']}    ${9}

Test Prime Numbers 36
    ${json_resp}=    Get next2 JSON    ${36}
    Should Be Equal    ${json_resp['mrg']}    ${38}

Test N2
    ${json_resp}=    Get next2 JSON    ${3.5}
    Should Be Equal    ${json_resp['mrg']}    ${5.5}