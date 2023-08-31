*** Settings ***
Library            SeleniumLibrary

*** Variables ***
${input_name}            //input[@id="form-field-nome"]
${input_email}           //input[@id="form-field-email"]
${input_telefone}        //input[@id="form-field-telefone"]
${input_Assunto}         //input[@id="form-field-assunto"]
${input_sua_mensagem}    //textarea[@id="form-field-mensagem"]
${Button_Enviar}         //button[@class="elementor-button pafe-form-builder-button elementor-size-xs"]

*** Keywords ***
Abrir navegador e acessar site
    open browser    https://gicbrasil.com/contato/    chrome

Preencher formulario
    Input Text    ${input_name}            teste
    Input Text    ${input_email}           teste.br@testete.com
    Input Text    ${input_telefone}        11999999999
    Input Text    ${input_Assunto}         teste
    Input Text    ${input_sua_mensagem}    teste

Então o usuario deve clicar em entrar
    Click Button    ${Button_Enviar}
Fechar navegador
    Close Browser

*** Test Cases ***
Cenario 1: Teste Abrir navegador
    Abrir navegador e acessar site
    Preencher formulario
    Então o usuario deve clicar em entrar