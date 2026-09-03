*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://www.saucedemo.com/
${normal_user}    standard_user
${locked_out_user}    locked_out_user
${problem_user}    problem_user
${performance_glitch_user}    performance_glitch_user
${error_user}    error_user
${visual_user}    visual_user
${password}    secret_sauce


*** Test Cases ***
LoginTest
    openWebsite
    logintoWebSite
    

*** Keywords ***
openWebsite
    Open Browser    ${url}    ${browser}
logintoWebSite
    Input Text    xpath=//*[@id="user-name"]    ${normal_user}   
    Input Text    xpath=//*[@id="password"]    ${password}
    Click Button    id=login-button

