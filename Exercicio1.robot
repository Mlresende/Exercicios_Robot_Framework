*** Settings ***
Library            SeleniumLibrary
*** Variables ***
${Variavel1}    teste
${Variavel2}    hhhhh
${Variavel3}    155455
*** Keywords ***
Abrir o site do google
    Open Browser    https://www.google.com/    Chrome   

Fechar navegador
    Close Browser

Abrir o site da globo   
    Open Browser    https://www.globo.com/    Chrome

*** Test Cases ***
Cenario 1: Teste Abrir navegador
    Abrir o site do google
    Fechar navegador

Cenario 2: Fechar navegador
    Abrir o site da globo
    Fechar navegador

