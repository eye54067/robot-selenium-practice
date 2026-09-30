*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common.resource
Test Tags    regression

*** Variables ***
${xpath_tables_menu}    xpath=//a[text()="Tables"]
${xpath_dynamic_table_submenu}    xpath=//a[text()="Dynamic Table"]
${xpath_dynamic_table}    xpath=//*[@id="data-table"]

*** Test Cases ***
Open Test Website
    Open QA-Automation-Practice Application
    Wait Until Page Contains Element    ${xpath_tables_menu}
Go To Test Page
    Scroll Element Into View    ${xpath_tables_menu}
    Click Element    ${xpath_tables_menu}
    Wait Until Element Is Visible    ${xpath_dynamic_table_submenu}
    Click Element    ${xpath_dynamic_table_submenu}
Verify Table Should Be Visible
    Wait Until Element Is Visible    ${xpath_dynamic_table}
    Sleep    3
Verify Table Column
    ${column_count}=    Get Element Count    ${xpath_dynamic_table}/thead/tr/th
    Should Be Equal As Integers    ${column_count}        7
    ${h1}=    Get Text    ${xpath_dynamic_table}/thead/tr/th[1]
    ${h2}=    Get Text    ${xpath_dynamic_table}/thead/tr/th[2]
    ${h3}=    Get Text    ${xpath_dynamic_table}/thead/tr/th[3]
    ${h4}=    Get Text    ${xpath_dynamic_table}/thead/tr/th[4]
    ${h5}=    Get Text    ${xpath_dynamic_table}/thead/tr/th[5]
    ${h6}=    Get Text    ${xpath_dynamic_table}/thead/tr/th[6]
    ${h7}=    Get Text    ${xpath_dynamic_table}/thead/tr/th[7]
    Should Be Equal As Strings    ${h1}    Avatar
    Should Be Equal As Strings    ${h2}    First Name
    Should Be Equal As Strings    ${h3}    Last Name
    Should Be Equal As Strings    ${h4}    Age
    Should Be Equal As Strings    ${h5}    Email
    Should Be Equal As Strings    ${h6}    City
    Should Be Equal As Strings    ${h7}    Country
Verfify Row Should be more than 0
    ${row_count}=    Get Element Count    ${xpath_dynamic_table}/tbody/tr
    Should Be True    ${row_count} > 0
Verify All Column Data Types
    #Verify Avatar Column Should Be Image
    Check Column Is Image    1
    #Verify First, Last Name, City, Country Column Should Be String
    Check Column Is String    2
    Check Column Is String    3
    Check Column Is String    6
    Check Column Is String    7
    #Verify Age Coulumn Should Be Integer
    Check Column Is Integer    4
    #Verify Email Column Should Be Email
    Check Column Is Email    5

*** Keywords ***
Check Column Is Integer
    [Arguments]    ${col}
    ${rows}=    Get Element Count    ${xpath_dynamic_table}/tbody/tr
    FOR    ${i}    IN RANGE    1    ${rows}+1
        ${value}=    Get Text    ${xpath_dynamic_table}/tbody/tr[${i}]/td[${col}]
        Should Match Regexp    ${value}    ^\\d+$
    END
Check Column Is String
    [Arguments]    ${col}
    ${rows}=    Get Element Count    ${xpath_dynamic_table}/tbody/tr
    FOR    ${i}    IN RANGE    1    ${rows}+1
        ${value}=    Get Text    ${xpath_dynamic_table}/tbody/tr[${i}]/td[${col}]
        Should Match Regexp    ${value}    ^[^\\d\\W]+(\\s[^\\d\\W]+)*$
    END
Check Column Is Image
    [Arguments]    ${col}
    ${rows}=    Get Element Count    ${xpath_dynamic_table}/tbody/tr
    FOR    ${i}    IN RANGE    1    ${rows}+1
    Element Should Be Visible    ${xpath_dynamic_table}/tbody/tr[${i}]/td[${col}]//img
    END    
Check Column Is Email
    [Arguments]    ${col}
    ${rows}=    Get Element Count    ${xpath_dynamic_table}/tbody/tr
    FOR    ${i}    IN RANGE    1    ${rows}+1
        ${value}=    Get Text    ${xpath_dynamic_table}/tbody/tr[${i}]/td[${col}]
        Should Match Regexp    ${value}    ^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$
    END