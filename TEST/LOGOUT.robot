*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
Library    DateTime
Library    OperatingSystem

*** Variables ***

*** Keywords ***
Save Screenshot With Timestamp
    [Arguments]    ${name}
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    ${path}=         Set Variable    ${CURDIR}/screenshots/${name}_${timestamp}.png
    Create Directory    ${CURDIR}/screenshots
    Capture Page Screenshot    ${path}


*** Test Cases ***
Logout Test Case
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    id=user-name    standard_user
    Input Text    id=password    secret_sauce
#    Capture Page Screenshot
    Click Button    id:login-button
    Wait Until Element Is Visible    id=react-burger-menu-btn
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    id=logout_sidebar_link
    Click Element   id=logout_sidebar_link
#    Sleep    5
    Wait Until Element Is Visible    id=login-button
#    Element Should Be Visible        id=login-button
    Save Screenshot With Timestamp    logout
