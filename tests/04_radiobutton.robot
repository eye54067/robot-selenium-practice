*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common.resource

*** Variables ***
${path_radio_1}    //label[text()='Radio button 1']/preceding-sibling::input[@type='radio']
${path_radio_2}    //label[text()='Radio button 2']/preceding-sibling::input[@type='radio']
${path_radio_3}    //label[text()='Radio button 3']//preceding-sibling::input[@type='radio']
${path_radio_4}    //label[text()='Radio button 4 - disabled']/preceding-sibling::input[@type='radio']

*** Test Cases ***
Open Test Website
    Open QA-Automation-Practice Application
Click Radio Button 1
    Wait Until Page Contains Element    xpath=//*[@id="buttons"]
    clickButtonsSubmenu
    clickRadioMenu
    clickRadioButton1
Click Radio Button 2
    clickRadioButton2
Click Radio Button 3
    clickRadioButton3
Verify Radio Button 4 is Disabled
    Element Should Be Disabled    xpath=${path_radio_4}
    
*** Keywords ***
clickButtonsSubmenu
    Click Element    xpath=//*[@id="buttons"]
    Sleep    1
    Element Should Be Visible    xpath=//*[@id="checkboxes"]
    Element Should Be Visible    xpath=//*[@id="radio-buttons"]
clickRadioMenu
    Click Element    xpath=//*[@id="radio-buttons"]
    Sleep    1
clickRadioButton1
    Page Should Contain    Radio button 1
    Click Element    xpath=${path_radio_1}
clickRadioButton2
    Page Should Contain    Radio button 2
    Click Element    xpath=${path_radio_2}
clickRadioButton3
    Page Should Contain    Radio button    3
    Click Element    xpath=${path_radio_3}




