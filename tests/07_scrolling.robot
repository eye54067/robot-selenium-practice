*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common.resource
Test Tags    regression

*** Variables ***
${xpath_btn_menu}    xpath=//a[text()='Btn actions']
${xpath_scrolling_submenu}    xpath=//*[@id='scrolling']
${xpath_start_text}    xpath=//*[@id="main"]/div[1]/h3
${xpath_end_text}    xpath=//*[@id="the-end"]

*** Test Cases ***
Open Test Website
    Open QA-Automation-Practice Application
    Wait Until Page Contains Element    ${xpath_btn_menu} 
Go To Scrolling page
    Click Element    ${xpath_btn_menu}
    Wait Until Element Is Visible    ${xpath_scrolling_submenu}
    Click Element    ${xpath_scrolling_submenu}
    Wait Until Page Contains    Scrolling Demo
Scroll To The First Word
    Scroll Element Into View    ${xpath_start_text}
Scroll To The Last Word
    Scroll Element Into View    ${xpath_end_text}


*** Keywords ***


