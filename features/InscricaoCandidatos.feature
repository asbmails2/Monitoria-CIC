Feature: Cadastrar candidato

#if ($Cadastrar Candidato Happy Path GUI)
Scenario: Cadastrar Candidato Happy Path GUI
	Given I am on the Candidatos page
	When I press the image "Cadastrar Candidato"
	Then I should be on the Cadastrar Candidato page
	When I fill in "Nome" with "Candidato 1"
	When I fill in "Matrícula" with "1300123456"
	And I press input "Salvar"
	Then I should be on the Candidatos page
	And I should see "Candidato 1 incluído com sucesso."
#end

#if ($Remover Candidato Happy Path GUI)
Scenario: Remover Candidato Happy Path GUI
	Given I am on the Candidatos page
	When I follow the link containing the "Mateus Andrade"
	Then I should be on the Show Mateus Andrade page
	When I press the image "Deletar"
	Then I should be on the Candidatos page
	And I should see "Candidato Mateus Andrade removido com sucesso."
#end

#if ($Cadastrar Candidato Sad Path Controller)
Scenario: Cadastrar Candidato Existente - Sad Path (Controller)
	Given I am on the Candidatos page
	When I press the image "Cadastrar Candidato"
	Then I should be on the Cadastrar Candidato page
	When I fill in "Nome" with "Erick Medeiros"
	When I fill in "Matrícula" with "11123456"
	And I press input "Salvar"
	Then I should be on the Candidatos page
	And I should see "O candidato Erick Medeiros não foi incluído pois já existe."
#end
