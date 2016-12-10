Feature: Cadastrar professor da disciplina

#if ($Cadastrar Professor Happy Path GUI)
Scenario: Cadastrar Professor Happy Path GUI
	Given I am on the Professores page
	When I press the image "Cadastrar Professor"
	Then I should be on the Cadastrar Professor page
	When I fill in "Nome*" with "Professor 3"
	When I fill in "Email*" with "professor3@unb.br"
	When I fill in "Sala*" with "Sala A3-3-3"
	And I press input "Salvar"
	Then I should be on the Professores page
	And I should see "Professor 3 incluído com sucesso."
#end

#if ($Editar Professor Happy Path GUI)
Scenario: Editar Professor Happy Path GUI
	Given I am on the Professores page
	When I follow the link containing the "Professor 2"
	Then I should be on the Show Professor 2 page
	And I press the image "Editar"
	Then I should be on the Editar Professor 2 page
	When I fill in "Nome*" with "Professor 2.1"
	And I press input "Salvar"
	Then I should be on the Professores page
	And I should see "Professor 2.1 foi editado com sucesso."
#end

#if ($Remover Professor Happy Path GUI)
Scenario: Remover Professor Happy Path GUI
	Given I am on the Professores page
	When I follow the link containing the "Professor 2"
	Then I should be on the Show Professor 2 page
	When I press the image "Deletar"
	Then I should be on the Professores page
	And I should see "Professor Professor 2 removido com sucesso."
#end

#if ($Cadastrar Professor Sad Path Controller)
Scenario: Cadastrar Professor Existente - Sad Path (Controller)
	Given I am on the Professores page
	When I press the image "Cadastrar Professor"
	Then I should be on the Cadastrar Professor page
	When I fill in "Nome*" with "Professor 1"
	When I fill in "Email*" with "professor1@unb.br"
	When I fill in "Sala*" with "Sala A1-1-1"
	And I press input "Salvar"
	Then I should be on the Professores page
	And I should see "O professor Professor 1 não foi incluído pois já existe."
#end

#if ($Editar Professor Sad Path Controller)
Scenario: Editar Professor Existente - Sad Path (Controller)
	Given I am on the Professores page
	When I follow the link containing the "Professor 2"
	Then I should be on the Show Professor 2 page
	And I press the image "Editar"
	Then I should be on the Editar Professor 2 page
	When I fill in "Nome*" with "Professor 1"
	When I fill in "Email*" with "professor1@unb.br"
	And I press input "Salvar"
	Then I should be on the Professores page
	And I should see "O professor Professor 1 não foi modificado pois já existe."
#end