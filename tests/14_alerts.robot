*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common.resource

*** Variables ***
${xpath_alerts_menu}    xpath=//a[@id="alerts"]
${xpath_alert_btn}    xpath=//button[@id="alert-btn"]
${xpath_confirm_btn}    xpath=//button[@id="confirm-btn"]

*** Test Cases ***
Open Test Website
    Open QA-Automation-Practice Application
    Wait Until Page Contains Element    ${xpath_alerts_menu}
Go To Test Page And Verify Elements
    Click Element    ${xpath_alerts_menu}
    Wait Until Page Contains    Alerts Example
    Page Should Contain Button    ${xpath_alert_btn}
    Element Should Be Enabled    ${xpath_alert_btn}
    Page Should Contain Button    ${xpath_confirm_btn}
    Element Should Be Enabled    ${xpath_confirm_btn}
Click Alert Button And Verify Alert Box
    Click Button    ${xpath_alert_btn}
    Alert Should Be Present    Hello! I am an alert box!!    action=LEAVE  
Click OK On Alert Box And Verify The Result     
    Handle Alert    action=ACCEPT
    Alert Should Not Be Present
Click Confirm Button And Verify Alert Box
    Click Button    ${xpath_confirm_btn}
    Alert Should Be Present    Press a button! Either OK or Cancel.    action=LEAVE
Click Cancel button on Alert Box And Verify The Result
    Handle Alert    action=DISMISS
    Alert Should Not Be Present
Click Confirm Button To Open Alert Box Again
    Click Button    ${xpath_confirm_btn}
    Alert Should Be Present    Press a button! Either OK or Cancel.    action=LEAVE
Click OK On Alert Box
    Handle Alert    action=ACCEPT
    Alert Should Not Be Present
    Close Browser

*** Keywords ***
