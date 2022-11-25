*** Settings ***
Library    SeleniumLibrary    timeout=10
Variables    ../Page objects/locators.py
*** Variables ***
${URL}    https://practicetestautomation.com/practice-test-login/
${BROWSER}    chrome
${var_username}    student
${var_password}    Password123
${var_username_érroné}    incorrectUser
${var_password_érroné}    incorrectPassword

*** Keywords ***
Ouvrire application
    # ouvrire le site de l'application
    [Arguments]    ${URL}    ${BROWSER}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2
Positive LogIn test
    # Saisir le user name
    Input Text    ${txt_username}    ${var_username}
    # Saisir le password
    Input Text    ${txt_password}    ${var_password}
    Sleep    2
    # Cliquer sur le bouton Submit
    Click Element    ${btn_login}
    # Retourne l'url de la nouvelle page
    ${url}    Get Location
    Log To Console    ${url} 
    Sleep    2 
    # Verifier que la nouvelle page contient : practicetestautomation.com/logged-in-successfully/  
    Page Should Contain    practicetestautomation.com/logged-in-successfully/
    Sleep    2
    # Retourne un texte dans la nouvelle page
    ${expected_text}    Get Text    //strong[contains(text(),'Congratulations student. You successfully logged i')]
    Log To Console    ${expected_text}
    # Vérifier que la nouvelle page contient l'expression : Congratulations 
    Page Should Contain    Congratulations
    Sleep    2
    # Vérifier l'existance du bouton Loug out
    Page Should Contain Link    //a[@class='wp-block-button__link has-text-color has-background has-very-dark-gray-background-color']
    ${button}    Get Text   //a[@class='wp-block-button__link has-text-color has-background has-very-dark-gray-background-color']
    Log To Console    ${button}
    Close all Browsers

Negative username test
    Ouvrire application    ${URL}    ${BROWSER}
    # Saisir le user name
    Input Text    ${txt_username}    ${var_username_érroné}
    # Saisir le password
    Input Text    ${txt_password}    ${var_password}
    Sleep    2
    # Cliquer sur le bouton Submit
    Click Element    ${btn_login}
    Page Should Contain    Your username is invalid!
    Sleep    2
    Close All Browsers

Negative password test
    Ouvrire application    ${URL}    ${BROWSER}
    # Saisir le user name
    Input Text    ${txt_username}    ${var_username}
    # Saisir le password
    Input Text    ${txt_password}    ${var_password_érroné}
    Sleep    2
    # Cliquer sur le bouton Submit
    Click Element    ${btn_login}
    Page Should Contain    Your password is invalid!
    Sleep    2
    Close All Browsers
    