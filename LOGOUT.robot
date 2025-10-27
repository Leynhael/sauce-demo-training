*** Settings ***
Resource    /Users/yhanie/PycharmProjects/PythonProject/SauceDemoTraining/RESOURCES/COMMON.robot
Test Setup    Open SauceDemo Browser
Test Teardown    Close Browser Session
Default Tags    Feature_Logout    Regression    ${browser}

*** Test Cases ***
Logout Test Case
     Open SauceDemo Browser
     Login To SauceDemo    ${username}    ${valid_password}
     Logout From SauceDemo
