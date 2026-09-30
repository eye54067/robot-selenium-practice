*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common.resource
Test Tags    regression

*** Variables ***
${xpath_file_upload_menu}    xpath=//a[text()="File Upload"]
${xpath_uploader}    xpath=//*[@id="file_upload"]
${xpath_submit_btn}    xpath=//button[@onclick="uploadFile()"]

*** Test Cases ***
Open Test Website
    Open QA-Automation-Practice Application
    Wait Until Page Contains Element    ${xpath_file_upload_menu}
Go To Test Page
    Click Element    ${xpath_file_upload_menu}
    Wait Until Page Contains    File Upload Example
Upload File
    Choose File    ${xpath_uploader}    /Users/eye/Documents/automation-robot/data/hello-kitty.jpg
    Click Button    ${xpath_submit_btn}
Verify The Result
    Wait Until Page Contains    You have successfully uploaded "hello-kitty.jpg"
    
*** Keywords ***
