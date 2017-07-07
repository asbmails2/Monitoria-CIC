Feature: cadastrar disciplina ofertada por um professor

Background: users in database
    Given the following users exist:
    |email|encrypted_password|reset_password_token|reset_password_sent_at|remember_created_at|sign_in_count|current_sign_in_at|last_sign_in_at|current_sign_in_ip|last_sign_in_ip|created_at|updated_at|admin_role|professor_role|student_role|
    |student@test.com|$2a$11$YMfyggXtB5s99.5m4Pn7IuhzrkxDHh/lZkR.Jq5.scV.7CYv4Dy4a||||1|2017-07-05 00:08:35.338214|2017-07-05 00:08:35.338214|127.0.0.1|127.0.0.1|2017-07-04 06:39:29.937882|2017-07-05 00:08:35.339527|f|f|t|
    |professor@test.com|$2a$11$9GKEfixOjhGDAurTKxN1S.vWDzKdW84amiQ3016L7fnuh3yVo6FhC||||3|2017-07-06 03:02:22.836805|2017-07-05 00:10:17.128231|127.0.0.1|127.0.0.1|2017-07-04 06:39:30.084994|2017-07-06 03:02:22.837942|f|t|f|
    |admin@test.com|$2a$11$AfacVyjdLASkOBN9Ve5wueX6lMPaOKwSWOmHr40nzMGOpX2hIYfDe||||0|||||2017-07-04 06:39:30.232669|2017-07-04 06:39:30.232669|t|f|f|

    Given the following candidatos exist:
    |nome|matricula|disciplina|monitoria|semestre|prioridade|id_of_user|
    |Mateus Andrade|10123456||Remunerada|3|0|0|
    |Erick Medeiros|11123456||Voluntaria|4|0|0|
    |estudante1|123123123|da|Remunerada|1|0|1|

    Given the following disciplinas exist:
    |nome|codigo|professor|vagas|created_at|updated_at|ativa|
    |Disciplina 1|cic01|Professor 1|3|2017-07-04 06:39:29.661949|2017-07-04 06:39:29.661949|t|
    |Disciplina 2|cic02|Professor 2|2|2017-07-04 06:39:29.676992|2017-07-04 06:39:29.676992|t|
    |Disciplina 2|cic02|Professor 1|2|2017-07-04 06:39:29.684424|2017-07-04 06:39:29.684424|t|
    |||TEste|3|2017-07-04 06:46:35.241063|2017-07-04 06:46:35.241063|t|
    |da||Professor 1|1|2017-07-04 06:47:35.633005|2017-07-04 06:47:35.633005|t|
    |dadada||TEste|3|2017-07-06 01:25:22.748303|2017-07-06 01:25:22.748303|t|


#if ($Cadastrar disciplina ofertada por um professor)
Scenario: Incluir nova disciplina a ser ofertada pelo professor
  Given I am on Sing In page
  When I press to Log In
  Then I should be on Sing In page
  When I fill in "user_email" with "admin@test.com"
  When I fill in "user_password" with "password"
  When I press input Log in
  Given I am on Home page
  Given I am on Disciplinas page
  Then I should be on Disciplinas page
  When I press Adicionar
  Then I should be on Cadastrar Disciplina page
  When I select "Disciplina 2" from "Nome"
  When I select "Professor 1" from "Professor"
  When I fill in "Vagas" with "2"
  And I press input "Salvar"
  Then I should be on Disciplinas page
#end

#if ($Cadastrar disciplina ofertada por um administrador)
Scenario: Incluir uma disciplina já existente pelo mesmo professor (Sad Path)
  Given I am on Sing In page
  When I press to Log In
  Then I should be on Sing In page
  When I fill in "user_email" with "admin@test.com"
  When I fill in "user_password" with "password"
  When I press input Log in
  Given I am on Disciplinas page
  When I press the image "Adicionar"
  Then I should be on Cadastrar Disciplina page
  When I select "Disciplina 1" from "Nome"
  When I select "Professor 1" from "Professor"
  When I fill in "Vagas" with "2"
  And I press input "Salvar"
  Then I should be on Disciplinas page
  And I should see "A oferta não foi incluída pois já existe"
#end

#if ($Cadastrar disciplina ofertada por um administrador)
Scenario: Editar uma disciplina existente
  Given I am on Sing In page
  When I press to Log In
  Then I should be on Sing In page
  When I fill in "user_email" with "admin@test.com"
  When I fill in "user_password" with "password"
  When I press input Log in
  Given I am on Disciplinas page
  When I follow "Disciplina 1"
  Then I should be on Show Disciplina 1 page
  And I press the image "Editar"
  Then I should be on Editar Disciplina 1 page
  When I select "Professor 1" from "Professor"
  When I fill in "Vagas" with "2"
  And I press input "Salvar"
  Then I should be on Disciplinas page
  And I should see "Disciplina foi editada com sucesso."
#end

#if ($Cadastrar disciplina ofertada por um professor)
Scenario: Exibir disciplinas ofertadas
  Given I am on Sing In page
  When I press to Log In
  Then I should be on Sing In page
  When I fill in "user_email" with "professor@test.com"
  When I fill in "user_password" with "password"
  When I press input Log in
  Given I am on Disciplinas page
  Then I should see "Disciplina 1"
#end

#if ($Cadastrar disciplina ofertada por um professor)
Scenario: Excluir uma disciplina ofertada existente
  Given I am on Disciplinas page
  When I follow the link containing the "Disciplina 1"
  Then I should be on Show Disciplina 1 page
  When I press the image "Deletar"
  Then I should be on Disciplinas page
  And I should see "Disciplina removida com sucesso"
#end
