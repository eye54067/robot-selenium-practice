*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common.resource

*** Variables ***
${xpath_iframe_menu}    xpath=//*[@id="iframes"]
${xpath_iframe_element}    xpath=//iframe[@id="iframe-checkboxes"]
${xpath_iframe_navbar_btn}    xpath=//button[@class="navbar-toggler"]
${iframe_h1_text}    xpath=//h1[text()="Hello, this is an Iframe!"]
${iframe_btn}    xpath=//a[@id="learn-more"]

*** Test Cases ***
Open Website
    Open QA-Automation-Practice Application
    Wait Until Page Contains Element    ${xpath_iframe_menu}
Go To Test Page And Verfiy Page Contains Iframe
    Scroll Element Into View    ${xpath_iframe_menu}
    Click Element    ${xpath_iframe_menu}
    Wait Until Page Contains Element    ${xpath_iframe_element}
Verify Elements On Iframe
    Select Frame    ${xpath_iframe_element}
    Page Should Contain Element   ${xpath_iframe_navbar_btn}
    Page Should Contain Element   ${iframe_h1_text}
    Element Should Be Enabled    ${iframe_btn}
Click Iframe Button and Verify Appeared Message
    Click Element    ${iframe_btn}
    Wait Until Page Contains    This text appears when you click the "Learn more" button
    
*** Keywords ***
