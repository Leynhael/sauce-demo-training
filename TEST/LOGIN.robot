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
Valid Login
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    id=user-name    standard_user
    Input Text    id=password    secret_sauce
#    Capture Page Screenshot
    Click Button    id:login-button
    Wait Until Element Is Visible    //span[@data-test='title' and text()='Products']
#    Page Should Contain Element    xpath=//div[@class='title']
#    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
#    Capture Page Screenshot    ${CURDIR}/screenshots/valid_login_${timestamp}.png
    Save Screenshot With Timestamp    valid_login

Invalid Password Login
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    id=user-name    standard_user
    Input Text    id=password    p@ssw0rd
    Click Button    id:login-button
    Wait Until Element Is Visible    //h3[@data-test='error' and text()='Epic sadface: Username and password do not match any user in this service']
#    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    Save Screenshot With Timestamp    invalid_pw_login
