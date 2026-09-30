*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common.resource
Test Tags    regression

*** Variables ***
${xpath_tables_menu}    xpath=//a[text()="Tables"]
${xpath_static_table_submenu}    xpath=//a[text()="Static Table"]
${xpath_static_table}    xpath=//*[@id="peopleTable"]

*** Test Cases ***
Open Test Website
    Open QA-Automation-Practice Application
    Wait Until Page Contains Element    ${xpath_tables_menu}
Go To Test Page
    Scroll Element Into View    ${xpath_tables_menu}
    Click Element    ${xpath_tables_menu}
    Wait Until Element Is Visible    ${xpath_static_table_submenu}
    Click Element    ${xpath_static_table_submenu}
    Wait Until Page Contains    Table Example
Verify Table Should Be Visible
    Element Should Be Visible    ${xpath_static_table}
Verify Table Should Have Correct Headers 
    ${h1}    Get Text    ${xpath_static_table}/thead/tr/th[1]
    ${h2}    Get Text    ${xpath_static_table}/thead/tr/th[2]
    ${h3}    Get Text    ${xpath_static_table}/thead/tr/th[3]
    ${h4}    Get Text    ${xpath_static_table}/thead/tr/th[4]
    Should Be Equal    ${h1}    \#
    Should Be Equal    ${h2}    First
    Should Be Equal    ${h3}    Last
    Should Be Equal    ${h4}    Email
Verify Table Should Have Correct Row Count
    ${count}=    Get Element Count    ${xpath_static_table}/tbody/tr
    Should Be Equal As Integers    ${count}    5
Verify Table Should Contain Expected Data
    Table Column Should Contain    ${xpath_static_table}    2    First    
    Table Row Should Contain    ${xpath_static_table}    1    Mark
Verify Specific Test Data In Specific Cell
    Table Cell Should Contain    ${xpath_static_table}    4    2    Larry
    Table Cell Should Contain    ${xpath_static_table}    4    3    Bow
    Table Cell Should Contain    ${xpath_static_table}    4    4    lbow@gmail.com
    
*** Keywords ***

