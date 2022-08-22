*** Settings ***
Documentation    Testes de consulta noo buscador Google
...  Abre o navegador e realiza a consulta
...  e realiza a consulta

Library  SeleniumLibrary

*** Test Cases ***
Consulta Google
    [Tags]    completo, rapido
    Acessar o Chrome na pagina <https://www.google.com.br>
    No campo de pesquisa digitar "Ovos de Páscoa"
    Validar se aparece no titulo da guia o resultado esperado
    Fechar o browser

*** Keywords ***
Provided precondition
Acessar o ${browser} na pagina <${url}>
    open browser  ${url} ${browser}

No campo de pesquisa digitar "${termo}"
    Set Test Variable   ${termo}
    input text          name  =  q      ${termo}
    press keys          name  =  q      ENTER

Validar se aparece no titulo da guia o resultado esperado
    ${titulo} = get title
    Should contain  ${titulo}       ${termo}

Fechar o browser
    close browser