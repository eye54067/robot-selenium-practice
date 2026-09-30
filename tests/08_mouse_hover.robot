*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common.resource
Test Tags    regression

*** Variables ***
${xpath_btn_menu}    xpath=//a[text()='Btn actions']
${xpath_hover_submenu}    xpath=//*[@id="mouse-hover"]
${xpath_first_element}    xpath=//*[@id="demo"][text()="If you hover this text, it will be changed."]
${xpath_first_result}    xpath=//*[@id="demo"][text()="HOVERED"]
${xpath_second_element}    xpath=//*[@id="button-hover-over"]

*** Test Cases ***
Open Test Website
    Open QA-Automation-Practice Application
    Wait Until Page Contains Element    ${xpath_btn_menu}
Go To Mouse Hover Page
    Click Element    ${xpath_btn_menu}
    Wait Until Element Is Visible    ${xpath_hover_submenu}
    Click Element    ${xpath_hover_submenu}
    Wait Until Page Contains    Mouse Hover Example
Mouse Hover The First Element
    Mouse Over    ${xpath_first_element}
    Wait Until Element Is Visible    ${xpath_first_result}
    Element Should Not Be Visible    ${xpath_first_element}
    Sleep    1
Mouse Hover The Second Element
    Mouse Over    ${xpath_second_element}
    Sleep    1
    Page Should Contain    I am shown when someone hovers over the text above.

*** Keywords ***