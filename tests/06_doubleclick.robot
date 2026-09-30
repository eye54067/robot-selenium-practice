*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common.resource
Test Tags    regression

*** Variables ***
${xpath_btn_menu}    xpath=//a[text()='Btn actions']
${xpath_double_click_submenu}    xpath=//a[text()='Double click btn']
${xpath_double_click_me_btn}    xpath=//*[@id='double-click-btn']
${xpath_double_click_result}    xpath=//*[@id='double-click-result']

*** Test Cases ***
Open Test Website
    Open QA-Automation-Practice Application
    Wait Until Page Contains Element    ${xpath_btn_menu}
Click Btn actions menu
    clickBtnActionsMenu
Click double click btn menu
    clickDoubleActionsSubMenu
Double click on button and validate the result
    doubleClickOnButton

*** Keywords ***
clickBtnActionsMenu
    Click Element    ${xpath_btn_menu}
    Sleep    1
    Wait Until Page Contains Element    ${xpath_double_click_submenu}
clickDoubleActionsSubMenu
    Click Element    ${xpath_double_click_submenu}
    Wait Until Element Is Visible    ${xpath_double_click_me_btn}
doubleClickOnButton
    Double Click Element    ${xpath_double_click_me_btn}
    Sleep    1
    Wait Until Element Is Visible    ${xpath_double_click_result}
    Page Should Contain    Congrats, you double clicked!