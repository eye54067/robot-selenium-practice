*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/common.resource

*** Variables ***
${loader_menu}    xpath=//a[text()="Loader"]
${loader}    xpath=//*[@id="loader"]

*** Test Cases ***
Open Test Website
    Open QA-Automation-Practice Application
    Page Should Contain Element    ${loader_menu}
Go To Test Page
    Click Element    ${loader_menu}
Verify Loader And The Result After Loading Stop
    Wait Until Element Is Visible    ${loader}
    Wait Until Element Is Not Visible    ${loader}
    Page Should Contain    Tada!
    Page Should Contain    Some text in my newly loaded page..

*** Keywords ***

 