*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://qa-automation-practice.netlify.app/
${xpath_dropdown_menu}    xpath=//a[text()='Dropdowns']
${xpath_country_dropdown}    xpath=//select[@id='dropdown-menu']
*** Test Cases ***
Test Dropdown
    openWebSite
    clickDropdownMenu
    verifyCountryDropdownNotSelected
    selectCountryDropdown1
    selectCountryDropdown2
*** Keywords ***
openWebSite
    Open Browser    ${url}    ${browser}
    Maximize Browser Window    
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
