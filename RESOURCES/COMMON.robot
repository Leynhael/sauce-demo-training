*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
Library    DateTime
Library    OperatingSystem
Library    String
Variables    /Users/yhanie/PycharmProjects/PythonProject/SauceDemoTraining/RESOURCES/selectors.py

*** Variables ***
${BASE_URL}           https://www.saucedemo.com/
${CHROMEDRIVER_PATH}  /opt/homebrew/bin/chromedriver
${username}    standard_user  
${valid_password}    secret_sauce
${invalid_password}    p@ssword
${browser}    chrome

*** Keywords ***
Open SauceDemo Browser
    Open Browser    ${BASE_URL}    ${browser}
Login To SauceDemo
    [Arguments]    ${username}    ${password}
    Input Text      ${SELECTORS["username_field"]}    ${username} 
    Input Password  ${SELECTORS["password_field"]}    ${password}
    Click Button    ${SELECTORS["login_button"]}
Logout From SauceDemo
    Click Button    ${SELECTORS["menu_button"]}
    Wait Until Element Is Visible    ${SELECTORS["logout_link"]}
    Click Element   ${SELECTORS["logout_link"]}
    Wait Until Element Is Visible    ${SELECTORS["login_button"]}
Wait For Products Page
    Wait Until Element Is Visible    ${SELECTORS["title_products"]}
Wait For Invalid Login Error
    Wait Until Element Is Visible    ${SELECTORS["error_invalid_login"]}
Save Screenshot With Timestamp and Status
    [Arguments]    ${name}
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    ${date}=    Get Current Date    result_format=%Y%m%d
    ${status}=    Get Variable Value    ${TEST STATUS}    UNKNOWN
    ${test_name}=    Replace String    ${name}    ${SPACE}    _
    ${dir}=    Set Variable    ${CURDIR}/screenshots/${date}
    Run Keyword And Ignore Error    Create Directory    ${dir}
    ${path}=    Set Variable    ${dir}/${test_name}_${browser}_${status}_${timestamp}.png
    Capture Page Screenshot    ${path}
    Log    Screenshot saved: ${path}
Close Browser Session
    [Arguments]    ${take_screenshot}=True    ${name}=${TEST NAME}
    Run Keyword If    '${take_screenshot}' == 'True'    Save Screenshot With Timestamp and Status    ${name}
    Close All Browsers

