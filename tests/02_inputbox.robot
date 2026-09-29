*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common.resource
Suite Setup    Open Saucedemo Application
Suite Teardown    Close All Browsers

*** Variables ***


*** Test Cases ***
Test Input Box   
    Page Should Contain    Swag Labs 
    ${username_txt}    Set Variable    id=user-name
    Element Should Be Visible    ${username_txt}
    Element Should Be Enabled    ${username_txt}
    Input Text    ${username_txt}    standard_user
    Sleep    5
    Clear Element Text    ${username_txt}
    Sleep    5
    Close Browser

*** Keywords ***
