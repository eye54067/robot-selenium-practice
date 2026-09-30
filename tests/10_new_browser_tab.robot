*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common.resource
Test Tags    regression
*** Variables ***
${xpath_new_tab_window_menu}    xpath=//a[text()="New Tab / Window"]
${xpath_new_tab_submenu}    xpath=//*[@id="browser-tab"]
${xpath_new_tab_btn}    xpath=//*[@id="newTabBtn"]

*** Test Cases ***
Open Test Website
    Open QA-Automation-Practice Application
    Scroll Element Into View    ${xpath_new_tab_window_menu}
    Wait Until Page Contains Element    ${xpath_new_tab_window_menu}
Go To Test Page
    Scroll Element Into View    ${xpath_new_tab_window_menu}
    Click Element    ${xpath_new_tab_window_menu}
    Wait Until Element Is Visible    ${xpath_new_tab_submenu}
    Click Element    ${xpath_new_tab_submenu}
    Page Should Contain    Switch to a new Browser Tab
Click Button To Open New Tab
    Click Button    ${xpath_new_tab_btn}
    Switch Window    NEW
    Sleep    1
    Page Should Contain    Table Example
Close New Window And Go To Main Window
    Close Window    
    Switch Window    MAIN
    Page Should Contain    Switch to a new Browser Tab
    Sleep    1
    
*** Keywords ***