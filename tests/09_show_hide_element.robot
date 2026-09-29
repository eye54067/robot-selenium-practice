*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common.resource

*** Variables ***
${xpath_btn_menu}    xpath=//a[text()='Btn actions']
${xpath_show_hide_submenu}    xpath=//*[@id="show-hide-elements"]    
${xpath_show_hide_btn}    xpath=//button[@id="showHideBtn"]
${xpath_visible_text}    xpath=//*[@id="hiddenText"]

*** Test Cases ***
Open Test Website
    Open QA-Automation-Practice Application
    Wait Until Page Contains Element    ${xpath_btn_menu}
Go To Test Page
    Click Element    ${xpath_btn_menu}
    Wait Until Element Is Visible    ${xpath_show_hide_submenu}
    Click Element    ${xpath_show_hide_submenu}
    Wait Until Page Contains    Show / Hide Element
Verfify Text Is Visible Before Click Btn
    Page Should Contain Element    ${xpath_visible_text}
Verify Text Is Invisible After Click Btn
    Click Button    ${xpath_show_hide_btn}
    Wait Until Element Is Not Visible    ${xpath_visible_text}
    

*** Keywords ***

