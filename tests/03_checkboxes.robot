*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common.resource
Suite Setup    Open QA-Automation-Practice Application
Suite Teardown    Close All Browsers
Test Tags    regression

*** Variables ***
${xpath_button_menu}    //*[@id="buttons"]
${xpath_checkbox_submenu}    xpath=//*[@id="checkboxes"]
${xpath_checkbox_1}    xpath=//label[text()='Check me out - 1']//preceding-sibling::input[@type='checkbox']
${xpath_checkbox_2}    xpath=//label[text()='Check me out - 2']//preceding-sibling::input[@type='checkbox']
${xpath_checkbox_3}    xpath=//label[text()='Check me out - 3']//preceding-sibling::input[@type='checkbox']
${xpath_reset_button}    xpath=//button[text()='Reset']

*** Test Cases ***
Test Checkboxes
    clickButtonMenu
    clickCheckboxesSubmenu
    verifyCheckbox1IsEnabled
    clickCheckbox1 
    verifyCheckbox2Isenabled
    clickCheckbox2
    verifyCheckbox3IsEnabled
    clickCheckbox3
    resetAllCheckboxes
    verifyAllCheckboxesAreUnselected
    
*** Keywords ***
clickButtonMenu
    Click Element    ${xpath_button_menu}
    Sleep    1
clickCheckboxesSubmenu
    Click Element    ${xpath_checkbox_submenu}
verifyCheckbox1IsEnabled
    Element Should Be Enabled    ${xpath_checkbox_1}
    Checkbox Should Not Be Selected    ${xpath_checkbox_1}
clickCheckbox1
    Click Element    ${xpath_checkbox_1}
    Checkbox Should Be Selected    ${xpath_checkbox_1}
verifyCheckbox2Isenabled
    Element Should Be Enabled    ${xpath_checkbox_2}
    Checkbox Should Not Be Selected    ${xpath_checkbox_2}
clickCheckbox2
    Click Element    ${xpath_checkbox_2}
    Checkbox Should Be Selected    ${xpath_checkbox_2}
verifyCheckbox3IsEnabled
    Element Should Be Enabled    ${xpath_checkbox_3}
    Checkbox Should Not Be Selected    ${xpath_checkbox_3}
clickCheckbox3
    Click Element    ${xpath_checkbox_3}
    Checkbox Should Be Selected    ${xpath_checkbox_3}
resetAllCheckboxes
    Click Button    ${xpath_reset_button}
verifyAllCheckboxesAreUnselected
    Checkbox Should Not Be Selected    ${xpath_checkbox_1}
    Checkbox Should Not Be Selected    ${xpath_checkbox_2}
    Checkbox Should Not Be Selected    ${xpath_checkbox_3}