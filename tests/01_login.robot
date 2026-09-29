*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common.resource
Suite Setup    Open Saucedemo Application
Suite Teardown    Close All Browsers

*** Variables ***
${normal_user}    standard_user
${locked_out_user}    locked_out_user
${problem_user}    problem_user
${performance_glitch_user}    performance_glitch_user
${error_user}    error_user
${visual_user}    visual_user
${password}    secret_sauce


*** Test Cases ***
Login With Valid Account
    validAccount
*** Keywords ***
validAccount
    Input Text    xpath=//*[@id="user-name"]    ${normal_user}   
    Input Text    xpath=//*[@id="password"]    ${password}
    Click Button    id=login-button

