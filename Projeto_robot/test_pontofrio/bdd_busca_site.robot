*** Settings ***
Library     SeleniumLibrary 


*** Variables ***
# Dados do Teste
${Buscar_Fogao}     Fogão Consul


# Variáveis de configuração
${URL}      https://www.pontofrio.com.br/
${Browser}  Chrome


# Mapeamento de elementos
${Input_pesquisar}              //input[@data-testid='search-form-input']
${Button_busca}                //button[@data-testid='search-form-button'] 
${Primeiro_Produto_Busca}      (//div[@class="css-1enexmx"])[1]

*** Keywords ***
Dado que eu abra o navegador e acesse o site ponto frio 
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
    

Quando eu digitar no campo encontre aqui as melhores ofertas 
    Input_Text  ${Input_pesquisar}  Fogão Consul

E clico no botão buscar
   Capture Page Screenshot  selenium-botao-antes-1.png
   Click Element  ${Button_busca}  
   Capture Page Screenshot   selenium-botao-depois-1.png
   Click Element  ${Button_busca}  
   

Então deverei visualizar o resultado da busca
    Wait Until Element Is Visible  ${Primeiro_Produto_Busca}  10s 
    Close Browser



*** Test Cases ***
Cenário 1: Abrir Navegador e Acessar Site Ponto frio
    Dado que eu abra o navegador e acesse o site ponto frio 
    Quando eu digitar no campo encontre aqui as melhores ofertas 
    E clico no botão buscar
    Então deverei visualizar o resultado da busca
