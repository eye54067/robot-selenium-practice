*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://qa-automation-practice.netlify.app/
${xpath_forms_menu}    xpath=//a[text()="Forms"]
${xpath_login_submenu}    xpath=//a[text()="Login"]
${xpath_}

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


*** Keywords ***

