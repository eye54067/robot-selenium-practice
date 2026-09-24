*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://qa-automation-practice.netlify.app/
${xpath_file_upload_menu}    xpath=//a[text()="File Upload"]
${xpath_uploader}    xpath=//*[@id="file_upload"]
${xpath_submit_btn}    xpath=//button[@onclick="uploadFile()"]

*** Test Cases ***
Open Test Website
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains Element    ${xpath_file_upload_menu}
Go To Test Page
    Click Element    ${xpath_file_upload_menu}
    Wait Until Page Contains    File Upload Example
Upload File
    Log To Console    ${CURDIR}
    Choose File    ${xpath_uploader}    ${CURDIR}${/}testdata${/}hello-kitty.jpg
    Click Button    ${xpath_submit_btn}
Verify The Result
    Wait Until Page Contains    You have successfully uploaded "hello-kitty.jpg"
    


*** Keywords ***