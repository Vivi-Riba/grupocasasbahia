*** Settings ***
Library     SeleniumLibrary 


*** Variables ***
# Dados do Teste
${Buscar_Fogao}     Fogão Consul



# Variáveis de configuração
${URL}      https://www.pontofrio.com.br/
${Browser}  Chrome


# Mapeamento de elementos
${Input_pesquisar}             //input[@data-testid='search-form-input']
${Button_busca}                //button[@data-testid='search-form-button'] 
${Primeiro_Produto_Busca}      (//div[@class="css-1enexmx"])[1]
${Button_Comprar}              //button[@data-testid='buy-butto']     
${Button_Continuar_Compra}     //button[@data-testid='confirm-button']     
${P_Seleção_Garantia}          (//p[@data-testid="titulo"])[1]
${Button_Continuar}            //button[@data-testid='continuar']     
${Item_Carrinho}               //li[@data-testid="cart-item"]
${Compra_Departamento}         //button[@aria-label="Compre por departamentos"]
${Eletroportáteis}             //span[contains(text(),"Eletroportáteis")]
${Indicado_com_base_visistas}  //img[@alt="Ar e Ventilação"]



*** Keywords ***
Dado que eu abra o navegador e acesse o site ponto frio 
   Open Browser  ${URL}  ${Browser}
   Maximize Browser Window
 

Quando eu digitar no campo encontre aqui as melhores ofertas 
    Input_Text  ${Input_pesquisar}  Fogão Consul

E clicar no botão buscar
   Capture Page Screenshot  selenium-botao-antes-1.png
   Click Element  ${Button_busca}  
   Capture Page Screenshot   selenium-botao-depois-1.png
   Click Element  ${Button_busca}  
   
E clico no primeiro produto da lista
    Wait Until Element Is Visible  ${Primeiro_Produto_Busca}  10s 
    Click Element ${Primeiro_Produto_Busca}  

E clicar no botão comprar
    Wait Until Element Is Visible  ${Button_Comprar}  10s 
    Click Element ${Button_Comprar}  
    Wait Until Element Is Visible  ${Button_Continuar_Compra}  10s 
    Click Element  ${Button_Continuar_Compra}  

Quando selecionar o radio button sem serviço técnico
    Wait Until Element Is Visible  ${P_Seleção_Garantia}  10s 
    Click Element  ${P_Seleção_Garantia}  

E clicar no botão continuar
   Click Element  ${Button_Continuar}

Entao visualizarei o produto adicionado ao carrinho
   Wait Until Element Is Visible  ${Item_Carrinho}  10s 
   Close Browser

Quando eu clicar em Compre por Departamento
   Click Element  ${Compra_Departamento}  
   Click Element  ${Compra_Departamento}  

E selecionar a categoria Eletroportáteis
  Click Element  ${Eletroportáteis}  

E clico em um produto "indicados com base nas suas visitas"
  Execute Javascript    window.scrollTo(0, 550)
  Click Element  ${Indicado_com_base_visistas}
 
 


*** Test Cases ***
Cenário 1: Adicionar produto ao carrinho através da busca
    Dado que eu abra o navegador e acesse o site ponto frio 
    Quando eu digitar no campo encontre aqui as melhores ofertas 
    E clicar no botão buscar
    E clico no primeiro produto da lista
    E clicar no botão comprar
    Quando selecionar o radio button sem serviço técnico
    E clicar no botão continuar
    Entao visualizarei o produto adicionado ao carrinho


Cenário 2: Adicionar produto ao carrinho através da compra por Departamento
    Dado que eu abra o navegador e acesse o site ponto frio 
    Quando eu clicar em Compre por Departamento
    E selecionar a categoria Eletroportáteis
    E clico no primeiro produto da lista
    E clicar no botão comprar
    Quando selecionar o radio button sem serviço técnico
    E clicar no botão continuar
    Entao visualizarei o produto adicionado ao carrinho


Cenário 3: Adicionar produto ao carrinho através dos indicados com base nas suas visitas
   Dado que eu abra o navegador e acesse o site ponto frio 
   E clico em um produto "indicados com base nas suas visitas"
   E clicar no botão comprar
   Quando selecionar o radio button sem serviço técnico
   E clicar no botão continuar
   Entao visualizarei o produto adicionado ao carrinho

   