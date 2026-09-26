*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://qa-automation-practice.netlify.app/
${xpath_date_pickers_menu}    xpath=//*[@id="date-picker"]
${xpath_drp_input}    xpath=//*[@id="range-date-calendar"]
${xpath_selected_drp}    xpath=//span[@class="drp-selected"]
${xpath_drp_calendar}    xpath=/html/body/div[2]
${xpath_drp_apply_btn}    xpath=/html/body/div[2]/div[4]/button[2]
${xpath_dp_input}    xpath=//*[@id="calendar"]
${xpath_dp_calendar}    xpath=//html/body/div[3]
${xpath_dp_prev_btn}    xpath=/html/body/div[3]/div[1]/table/thead/tr[1]/th[1]
${xpath_dp_next_btn}    xpath=/html/body/div[3]/div[1]/table/thead/tr[1]/th[3]
${xpath_dp_year}    xpath=/html/body/div[3]/div[1]/table/thead/tr[1]/th[2]
${xpath_selected_dp_month}    xpath=/html/body/div[3]/div[2]/table/tbody/tr/td/span[text()="Oct"]
${xpath_selected_dp_date}    xpath=/html/body/div[3]/div[1]/table/tbody/tr/*[text()="10"]

*** Test Cases ***
Open Test Website
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains Element    ${xpath_date_pickers_menu}
Go To Test Page
    Click Element    ${xpath_date_pickers_menu}
    Wait Until Page Contains    Range Date Picker Example
    Wait Until Page Contains    Basic Date Picker Example
Verify Current Value Before Typing On Date Range Picker Input Field
    ${value_before}=    Get Value    locator=${xpath_drp_input}
    Log To Console    Value before new input:${value_before}
Set New Date Range By Typing On Date Range Picker Input Field
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
Verify Value Before Setting New Date On Single-Month Date Calendar
    Element Should Be Visible    ${xpath_dp_input}
    ${before_date}=    Get Text    ${xpath_dp_input}
    Log To Console    Value before picking calendar: ${before_date}
    Should Match    ${before_date}    \
Set New Date On Single-Month Date Calendar
    Click Element    ${xpath_dp_input}
    Wait Until Page Contains Element    ${xpath_dp_calendar}
    Page Should Contain Element    ${xpath_dp_prev_btn}
    Page Should Contain Element    ${xpath_dp_next_btn}
    Click Element    ${xpath_dp_year}
    Wait Until Element Is Visible    ${xpath_selected_dp_month}
    Click Element    ${xpath_selected_dp_month}
    Wait Until Element Is Visible    ${xpath_selected_dp_date}
    Click Element    ${xpath_selected_dp_date}
    ${dp_result}=    Get Value    ${xpath_dp_input}
    Log To Console    New Date: ${dp_result}
    Should Match    ${dp_result}    10/10/2026

*** Keywords ***
