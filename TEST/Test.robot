*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Sauce Demo Site
    Open Browser    https://www.saucedemo.com/    chrome
    Page Should Contain    Swag Labs
    Wait Until Element Is Visible    id:user-name
    Page Should Contain Element    xpath=//div[@class='login_logo']
    Page Should Contain Button    css=input.submit-button
    Capture Page Screenshot
    Click Button    id:login-button
    Wait Until Element Is Visible    //h3[@data-test='error' and text()='Epic sadface: Username is required']
    Capture Page Screenshot
    Sleep    5
    Close Browser
