*** Settings ***
Documentation    Consultas no site da Petz

Library     SeleniumLibrary
Library     OperationSystem

Test Teardown   close browser


*** Variables ***
${browser}      Chrome
${url}          https://www.petz.com.br


*** Test Cases ***
Consulta produto clicando na lupa
    [Tags]    rapido
    Dado que acesso o site como cliente
    Quando escrevo "Ração" na barra de pesquisa
    E clico no botão da lupa
    Entao exibe um grid e a frase do resultado esperado

Consulta produto clicando no enter
    [Tags]    rapido
    Dado que acesso o site como cliente
    Quando escrevo "Ração" na barra de pesquisa
    E aperto a tecla enter
    Entao exibe um grid e a frase do resultado esperado

*** Keywords ***
Dado que acesso o site como cliente
    open browser    ${url}      ${browser}

Quando escrevo "${termo}" na barra de pesquisa
    Set Test Variable   ${termo}
    input text      id = search      ${termo}

E clico no botão da lupa
    double click element     button-search

E aperto a tecla enter
    press key       name = q    ENTER


Entao exibe um grid e a frase do resultado esperado
    element should contain      css = h2Categoria.nomeCategoria       Resultado para "${termo}"

