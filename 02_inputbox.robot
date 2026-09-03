*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://www.saucedemo.com/


*** Test Cases ***
TestingInputBox
    Open Browser    ${url}    ${browser}
    Maximize Browser Window    
    Title Should Be    Swag Labs 
    ${username_txt}    Set Variable    id=user-name
    Element Should Be Visible    ${username_txt}
    Element Should Be Enabled    ${username_txt}
    Input Text    ${username_txt}    standard_user
    Sleep    5
    Clear Element Text    ${username_txt}
    Sleep    5
    Close Browser




*** Keywords ***
