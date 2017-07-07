Feature: Login de usuário
  Testando os níveis de usuário e o que ele vê na barra de opções
  As senhas para cada usuário são password - peguei os valores dentro do banco de dados sqlite

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

#if ($Login de estudante)
Scenario:
  Given I am on Sing In page
  When I press to Log In
  Then I should be on Sing In page
  And I fill in "user_email" with "student@test.com"
  And I fill in "user_password" with "password"
  And I press input Log in
  Then I should be on Home page

#if ($Login de professor)
  Scenario:
    Given I am on Sing In page
    When I press to Log In
    Then I should be on Sing In page
    When I fill in "user_email" with "professor@test.com"
    When I fill in "user_password" with "password"
    When I press input Log in

#if ($Login de professor)
  Scenario:
    Given I am on Sing In page
    When I press to Log In
    Then I should be on Sing In page
    When I fill in "user_email" with "admin@test.com"
    When I fill in "user_password" with "password"
    When I press input Log in
