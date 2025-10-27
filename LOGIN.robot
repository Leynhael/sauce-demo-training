*** Settings ***
Resource    /Users/yhanie/PycharmProjects/PythonProject/SauceDemoTraining/RESOURCES/COMMON.robot
Test Setup    Open SauceDemo Browser
Test Teardown    Close Browser Session
Default Tags    Feature_Login    Regression    ${browser}

*** Test Cases ***
Valid Login
    Open SauceDemo Browser
    Login To SauceDemo    ${username}    ${valid_password}
    Wait For Products Page
    Save Screenshot With Timestamp    valid_login

Invalid Password Login
    Open SauceDemo Browser
    Login To SauceDemo    ${username}    ${invalid_password}
    Wait For Invalid Login Error
    Save Screenshot With Timestamp    invalid_pw_login
