*** Settings ***
Documentation    Common keywords and variables shared across all test suites
Library    SeleniumLibrary


*** Variables ***
${browser}    chrome
${url_1}    https://www.saucedemo.com/
${url_2}    https://qa-automation-practice.netlify.app/


*** Keywords ***
Open Saucedemo Application
    [Documentation]    Opens the browser and navigates to the Saucedemo URL
    Open Browser    ${url_1}    ${browser}
    Maximize Browser Window
Open QA-Automation-Practice Application
    [Documentation]    Opens the browser and navigates to the qa-automation-practice URL
    Open Browser    ${url_2}    ${browser}
    Maximize Browser Window

