*** Settings ***
Resource    /Users/yhanie/PycharmProjects/PythonProject/SauceDemoTraining/RESOURCES/COMMON.robot
Test Setup    Open SauceDemo Browser
Test Teardown    Close Browser Session
Default Tags    Feature_Login    Regression    ${browser}

*** Test Cases ***
Valid Login
    Login To SauceDemo    ${username}    ${valid_password}
    Wait For Products Page

Invalid Password Login
    Login To SauceDemo    ${username}    ${invalid_password}
    Wait For Invalid Login Error