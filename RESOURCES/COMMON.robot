*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
Library    DateTime
Library    OperatingSystem
Variables    /Users/yhanie/PycharmProjects/PythonProject/SauceDemoTraining/RESOURCES/selectors.py

*** Variables ***
${BASE_URL}           https://www.saucedemo.com/
${CHROMEDRIVER_PATH}  /opt/homebrew/bin/chromedriver


*** Keywords ***
Wait For Products Page
    Wait Until Element Is Visible    //span[@data-test='title' and text()='Products']

Wait For Invalid Login Error
    Wait Until Element Is Visible    //h3[@data-test='error' and text()='Epic sadface: Username and password do not match any user in this service']

Save Screenshot With Timestamp
    [Arguments]    ${name}
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    ${path}=         Set Variable    ${CURDIR}/screenshots/${name}_${timestamp}.png
    Create Directory    ${CURDIR}/screenshots
    Capture Page Screenshot    ${path}

