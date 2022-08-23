*** Settings ***
Documentation    Testes de consulta noo buscador Google
...  Abre o navegador e realiza a consulta
...  e realiza a consulta

Library  SeleniumLibrary
Library  OperatingSystem


*** Variables ***
${browser}  Chrome
${url}      https://www.google.com.br


*** Test Cases ***
Consulta Google
    [Tags]    completo, rapido
    Acessar o Chrome na pagina <https://www.google.com.br>
    Digite "Ovos de páscoa" na barra de pesquisa
    Validar se aparece no titulo da guia o resultado esperado
    Fechar o browser



*** Keywords ***
setup chromedriver
    set environment variable     webdriver.chrome.driver     C:\\Iterasys\\robot_framework\\133PetsRobotFramework\\venv\\WebDriverManager\\chrome\\104.0.5112.79\\chromedriver_win32\\chromedriver.exe


Provided precondition



Acessar o ${browser} na pagina <${url}>
    open browser  ${url}    ${browser}

Digite "${termo}" na barra de pesquisa
    Set Test Variable   ${termo}
    input text          name = q      ${termo}
    press keys          name = q      ENTER



Validar se aparece no titulo da guia o resultado esperado
    ${titulo} =     Get title
    Should contain    ${titulo}       ${termo}


Fechar o browser
    close browser