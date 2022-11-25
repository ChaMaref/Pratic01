*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/keywords LogIn test.robot
*** Test Cases ***
TP
    Ouvrire application    ${URL}    ${BROWSER}
    Positive LogIn test
    Negative username test
    Negative password test