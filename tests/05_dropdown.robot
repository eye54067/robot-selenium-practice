*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common.resource
Test Tags    regression

*** Variables ***
${xpath_dropdown_menu}    xpath=//a[text()='Dropdowns']
${xpath_country_dropdown}    xpath=//select[@id='dropdown-menu']
${xpath_multi_dropdown_button}    xpath=//button[@id="multi-level-dropdown-btn"]
${xpath_hovered_dropdown}    xpath=//a[text()='Hover me for more options']
${xpath_hovered_dropdown_2}    xpath=//a[text()='Even More..']
${xpath_hovered_dropdown_3}    xpath=//a[text()='another level']
${xpath_dropdown_4}    xpath=//a[text()='4th level - 1']
${result_url}    https://qa-automation-practice.netlify.app/dropdowns#4th-level-1

*** Test Cases ***
Test Simple Dropdown
    Open QA-Automation-Practice Application
    clickDropdownMenu
    verifyCountryDropdownNotSelected
    selectCountryDropdown1
    selectCountryDropdown2
Test Multi-Level Dropdown
    clickDropdownButton
    hoverMultiDropdownLevel1
    hoverMultiDropdownLevel2
    hoverMultiDropdownLevel3
    clickDropdownLevel4

*** Keywords ***  
clickDropdownMenu
    Click Element    ${xpath_dropdown_menu}
    Sleep    1
verifyCountryDropdownNotSelected
    Select From List By Label    ${xpath_country_dropdown}    Select a country...
selectCountryDropdown1
    Select From List By Value    ${xpath_country_dropdown}    Thailand
    Sleep    1
selectCountryDropdown2
    Select From List By Value    ${xpath_country_dropdown}    Spain
    Sleep    1
clickDropdownButton
    Click Button    ${xpath_multi_dropdown_button}
    Sleep    1
hoverMultiDropdownLevel1
    Mouse Down    ${xpath_hovered_dropdown}
    Sleep    1
hoverMultiDropdownLevel2
    Mouse Down    ${xpath_hovered_dropdown_2}
    Sleep    1
hoverMultiDropdownLevel3
    Mouse Down    ${xpath_hovered_dropdown_3}
    Sleep    1
clickDropdownLevel4
    Click Element    ${xpath_dropdown_4}
    Location Should Be    ${result_url}