Feature: cadastrar disciplina ofertada por um professor

#if ($Cadastrar disciplina ofertada por um professor)
Scenario: Incluir nova disciplina a ser ofertada pelo professor
  Given I am on Disciplinas page
  When I press the image "Adicionar"
  Then I should be on Cadastrar Disciplina page
  When I select "Disciplina 2" from "Nome"
  When I select "Professor 1" from "Professor"
  When I fill in "Vagas" with "2"
  And I press input "Salvar"
  Then I should be on Disciplinas page
#end

#if ($Cadastrar disciplina ofertada por um professor)
Scenario: Incluir uma disciplina já existente pelo mesmo professor (Sad Path)
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

#if ($Cadastrar disciplina ofertada por um professor)
Scenario: Editar uma disciplina existente
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
