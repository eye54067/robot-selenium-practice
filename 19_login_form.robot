*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://qa-automation-practice.netlify.app/
${xpath_forms_menu}    xpath=//a[text()="Forms"]
${xpath_login_submenu}    xpath=//a[text()="Login"]
${xpath_email}    xpath=//*[@id="email"]
${xpath_password}       xpath=//*[@id="password"]
${xpath_submit_btn}    xpath=//*[@id="submitLoginBtn"]
*** Test Cases ***
Open Test Website
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains Element    ${xpath_forms_menu}   
Go To Test Page
    Click Element    ${xpath_forms_menu}
    Wait Until Page Contains Element    ${xpath_login_submenu}
    Scroll Element Into View    ${xpath_login_submenu}
    Click Element    ${xpath_login_submenu}
    Wait Until Page Contains    Login - Shop
Verify User Cannot Login With Empty Input Fields
    ${email}=    Get Text    ${xpath_email}              
    Log To Console    Email: ${email}
    ${password}=    Get Text    ${xpath_password}
    Log To Console    Password: ${password}
    Should Be Empty    ${email}    ${password}
    Click Button    ${xpath_submit_btn}
    Wait Until Page Contains    Bad credentials! Please try again! Make sure that you've registered.
Verify User Cannot Login With Only Email 
    Input Text    ${xpath_email}    admin@admin.com
    ${email}=    Get Value    ${xpath_email}
    Log To Console    ${email}
    Should Not Be Empty    ${email}
    ${password}=    Get Text    ${xpath_password}
    Should Be Empty    ${password}
    Click Button    ${xpath_submit_btn}
    Wait Until Page Contains    Bad credentials! Please try again! Make sure that you've registered.
Verify User Cannot Login With Only Password    
    Clear Element Text    ${xpath_email}
    Input Text    ${xpath_password}    1234567890
    ${password}=    Get Value    ${xpath_password}
    Log To Console    ${password}
    Should Not Be Empty    ${password}
    ${email}=    Get Value    ${xpath_email}
    Should Be Empty    ${email}
    Click Button    ${xpath_submit_btn}
    Wait Until Page Contains    Bad credentials! Please try again! Make sure that you've registered.
Verify User Can Login With Valid Email and Password
    Clear Element Text    ${xpath_password}
    Input Text    ${xpath_email}    admin@admin.com
    Input Password    ${xpath_password}    admin123
    Click Button    ${xpath_submit_btn}
    Page Should Not Contain    Bad credentials! Please try again! Make sure that you've registered.
    Wait Until Page Contains    SHOPPING CART


    
*** Keywords ***


