Feature: Registro de usuario
  Background:
    * def bodyAuth =  read("classpath:resources/json/auth/authRequest.json")
    * def schemaAuth = read("classpath:resources/json/auth/schemasResponse.json")
    Given url urlBase

  Scenario: CP01-Registro de usuario exitoso
    #copiamos la URL base a backgroung
    And path "/api/auth/register"
    #LLAMADO pero mejor se crea una variable a nivel backgrounf- read("classpath:resources/json/auth/authRequest.json")
    #And  request read("classpath:resources/json/auth/authRequest.json")
    And request bodyAuth.bodyRegisterOK
    When method post
    Then status 201
    And  match response == schemaAuth.schemaRegisterOK

  Scenario Outline: CP02-Registro de usuario exitoso con valores aleatorios
    #copiamos la URL base a backgroung
    And path "/api/auth/register"
    And request bodyAuth.bodyRegisterOK
    When method post
    Then status 201
    And  match response == schemaAuth.schemaRegisterOK

    Examples:
    | read("classpath:resources/csv/auth/dataLogin.csv") |

    Scenario : CP03-Registro de Usuario fallido
