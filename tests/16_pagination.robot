*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common.resource
Test Tags    regression

*** Variables ***
${pagination_menu}    xpath=//a[text()="Pagination"]
${pagination_element}    xpath=//*[@id="content"]/nav[2]
${page_previous}    xpath=//*[@class="page-item disabled"]
${page_1}    xpath=//*[@id="content"]/nav[2]/ul/li[2]/a
${page_2}    xpath=//*[@id="content"]/nav[2]/ul/li[3]/a
${page_3}    xpath=//*[@id="content"]/nav[2]/ul/li[4]/a
${page_next}    xpath=//*[@id="content"]/nav[2]/ul/li[5]/a

*** Test Cases ***
Open Test Website
    Open QA-Automation-Practice Application
    Page Should Contain Element    ${pagination_menu}
Go To Test Page
    Click Element    ${pagination_menu}
    Wait Until Page Contains Element    ${pagination_element}
Verify Page 1 Link Is Enabled
    Element Should Be Enabled    ${page_1}
Click Page 1 Link And Verify The Result
    Click Link    ${page_1}
    Wait Until Page Contains    You clicked page no. 1
Verify Page 2 Link Is Enabled
    Element Should Be Enabled    ${page_2}
Click Page 2 Link And Verify The Result
    Click Link    ${page_2}
    Wait Until Page Contains    You clicked page no. 2
Verify Page 3 Link Is Enabled
    Element Should Be Enabled    ${page_3}
Click Page 3 Link And Verify The Result
    Click Link    ${page_3}
    Wait Until Page Contains    You clicked page no. 3
Verify Page Link Next Should Be Enabled
    Element Should Be Enabled    ${page_next}
Click Page Link Next And Verify The Result
    Click Link    ${page_next}
    Wait Until Page Contains    You clicked the "Next" button 

*** Keywords ***