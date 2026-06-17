*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://qa-automation-practice.netlify.app/
${path_button_menu}    //*[@id="buttons"]
${path_checkbox_submenu}    //*[@id="checkboxes"]
${path_checkbox_1}    //label[text()='Check me out - 1']//preceding-sibling::input[@type='checkbox']
${path_checkbox_2}    //label[text()='Check me out - 2']//preceding-sibling::input[@type='checkbox']
${path_checkbox_3}    //label[text()='Check me out - 3']//preceding-sibling::input[@type='checkbox']
${path_reset_button}    //button[text()='Reset']

*** Test Cases ***
Open Test Website
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
Click Button Menu
    Click Element    xpath=${path_button_menu}
    Sleep    1
Click Checkboxes Submenu
    Click Element    xpath=${path_checkbox_submenu}
Verify Checkbox 1 is enabled
    Element Should Be Enabled    xpath=${path_checkbox_1}
    Checkbox Should Not Be Selected    xpath=${path_checkbox_1}
Click Checkbox 1
    Click Element    xpath=${path_checkbox_1}
    Checkbox Should Be Selected    xpath=${path_checkbox_1}
Verify Checkbox 2 is enabled
    Element Should Be Enabled    xpath=${path_checkbox_2}
    Checkbox Should Not Be Selected    xpath=${path_checkbox_2}
Click Checkbox 2
    Click Element    xpath=${path_checkbox_2}
    Checkbox Should Be Selected    xpath=${path_checkbox_2}
Verify Checkbox 3 is enabled
    Element Should Be Enabled    xpath=${path_checkbox_3}
    Checkbox Should Not Be Selected    xpath=${path_checkbox_3}
Click Checkbox 3
    Click Element    xpath=${path_checkbox_3}
    Checkbox Should Be Selected    xpath=${path_checkbox_3}
Reset All Checkboxes
    Click Button    xpath=${path_reset_button}
Verify All Checkboxes are unselected
    Checkbox Should Not Be Selected    xpath=${path_checkbox_1}
    Checkbox Should Not Be Selected    xpath=${path_checkbox_2}
    Checkbox Should Not Be Selected    xpath=${path_checkbox_3}

*** Keywords ***


