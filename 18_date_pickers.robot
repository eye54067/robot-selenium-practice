*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://qa-automation-practice.netlify.app/
${xpath_date_pickers_menu}    xpath=//*[@id="date-picker"]
${xpath_drp_input}    xpath=//*[@id="range-date-calendar"]
${xpath_basic_date_picker}    xpath=//*[@id="calendar"]
${xpath_selected_drp}    xpath=//span[@class="drp-selected"]
${xpath_drp_calendar}    xpath=/html/body/div[2]
${xpath_drp_apply_btn}    xpath=/html/body/div[2]/div[4]/button[2]


*** Test Cases ***
Open Test Website
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains Element    ${xpath_date_pickers_menu}
Go To Test Page
    Click Element    ${xpath_date_pickers_menu}
    Wait Until Page Contains    Range Date Picker Example
    Wait Until Page Contains    Basic Date Picker Example
Check For The Current Value Of Range Date
    ${value_before}=    Get Value    locator=${xpath_drp_input}
    Log To Console    Value before new input:${value_before}
Set New Date Range By Typing
    Clear Element Text    ${xpath_drp_input}
    ${input_value}=    Set Variable    09/01/2026 - 09/24/2026
    Input Text    ${xpath_drp_input}    ${input_value}
    Log To Console    Input value: ${input_value}
    ${selected_value}=    Get Text    ${xpath_selected_drp}
    Log To Console    Value displayed on carlendar: ${selected_value}
    Should Match    ${input_value}    ${selected_value}
    Element Should Be Visible    ${xpath_drp_calendar}
    Element Should Be Visible    ${xpath_drp_apply_btn}
    Click Button    ${xpath_drp_apply_btn}
    ${displayed_value}=    Get Value    ${xpath_drp_input}   
    Log To Console    Displayed value after clicking apply btn: ${displayed_value} 
    Should Match    ${input_value}    ${selected_value}    ${displayed_value}
    
    
*** Keywords ***
