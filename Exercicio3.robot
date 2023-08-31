*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
#Dados do teste
${nome_musica}    Amanhecer bk

#Variaveis de configuração
${URL}            https://www.youtube.com/
${Browser}        chrome

#Elementos
${input_search}         //input[@id="search"]
${button_search}        //button[@id="search-icon-legacy"]
#No caso a xpath do first_video estara entre parenteses e com [1] para indicar que queremos somente a primeira opção
${first_video}          (//yt-formatted-string[@class="style-scope ytd-video-renderer"])[1]
${confirm}              (//button[@class="yt-spec-button-shape-next yt-spec-button-shape-next--tonal yt-spec-button-shape-next--mono yt-spec-button-shape-next--size-m yt-spec-button-shape-next--icon-leading yt-spec-button-shape-next--segmented-start "])[1]

*** Keywords ***
Dado que o usuario acesse o site do Youtube
    Open Browser  ${URL}  ${Browser}

Quando digitar o nome da musica
    Input Text     ${input_search}    ${nome_musica}

E clicar no botão buscar
    Click Button    ${button_search}

E clicar na primeira opção da lista
#Nesse caso se for só utilizar o Click element é esperado um erro, por conta que ele vai clicar antes da pagina carregar.
#Logo o recomendado é usar o Wait Until Element Is Visible, para aguardar que o elemento apareça na tela e logo após utilizar o click element
    Wait Until Element Is Visible    ${first_video}  10
    Click Element    ${first_video}

Então o vídeo é executado
#Aqui é praticamente a mesma coisa do exemplo passado, porem o Element Should Be visible está sendo utilizado para validar o elemento, como por exemplo: Se o elemento confirm aparecer na tela, quer dizer que o video foi iniciado.
    Wait Until Element Is Visible    ${confirm}  10
    Element Should Be Visible    ${confirm}
    Sleep    10s

*** Test Cases ***
Cenario 1: Executar video no site do Youtube
    Dado que o usuario acesse o site do Youtube
    Quando digitar o nome da musica
    E clicar no botão buscar
    E clicar na primeira opção da lista
    Então o vídeo é executado