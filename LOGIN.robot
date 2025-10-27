*** Settings ***
Resource    /Users/yhanie/PycharmProjects/PythonProject/SauceDemoTraining/RESOURCES/COMMON.robot


*** Test Cases ***
Valid Login
    Open Browser    ${BASE_URL}    chrome
    Input Text    ${SELECTORS["login_username_field"]}    standard_user
    Input Text    ${SELECTORS["login_password_field"]}    secret_sauce
#    Capture Page Screenshot
    Click Button    ${SELECTORS["login_button"]}
    Wait For Products Page
#    Page Should Contain Element    xpath=//div[@class='title']
#    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
#    Capture Page Screenshot    ${CURDIR}/screenshots/valid_login_${timestamp}.png
    Save Screenshot With Timestamp    valid_login

Invalid Password Login
    Open Browser    ${BASE_URL}    chrome
    Input Text    ${SELECTORS["login_username_field"]}    standard_user
    Input Text    ${SELECTORS["login_password_field"]}    p@ssw0rd
    Click Button    ${SELECTORS["login_button"]}
    Wait For Invalid Login Error
#    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    Save Screenshot With Timestamp    invalid_pw_login
