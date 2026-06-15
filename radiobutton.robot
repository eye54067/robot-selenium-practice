*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://qa-automation-practice.netlify.app/

*** Test Cases ***
Testing Radio Buttons
    Open Browser    ${url}    ${browser}
    Maximize Browser Window  
    Wait Until Page Contains Element    xpath=//*[@id="buttons"]
    clickButtonsSubmenu
    clickRadioMenu
    clickRadioButton
   
*** Keywords ***
clickButtonsSubmenu
    Click Element    xpath=//*[@id="buttons"]
    Sleep    1
    Element Should Be Visible    xpath=//*[@id="checkboxes"]
    Element Should Be Visible    xpath=//*[@id="radio-buttons"]
clickRadioMenu
    Click Element    xpath=//*[@id="radio-buttons"]
    Sleep    1
clickRadioButton
    Page Should Contain    Radio button 1
    Sleep    1
    Click Element    xpath=//label[text()='Radio button 1']/preceding-sibling::input[@type='radio']
    Sleep    1

