Feature: Classificar prioridade de candidato

#if ($Classificar Prioridade de Candidato Happy Path GUI)
Scenario: Classificar Prioridade Candidato Happy Path GUI
	Given I am on the Candidatos page
	When I follow the link containing the "Mateus Andrade"
	Then I should be on the Show Mateus Andrade page
	And I press the image "Editar"
	Then I should be on the Editar Mateus Andrade page
	When I select 8 from "Prioridade do Candidato"
	And I press input "Salvar"
	Then I should be on the Candidatos page
	And I should see "Mateus Andrade foi editado com sucesso."
#end

#if ($Classificar Prioridade de Candidato Sad Path Controller)
Scenario: Classificar Prioridade Candidato Existente - Sad Path (Controller)
	Given I am on the Candidatos page
	When I follow the link containing the "Mateus Andrade"
	Then I should be on the Show Mateus Andrade page
	And I press the image "Editar"
	Then I should be on the Editar Mateus Andrade page
	When I fill in "Nome" with "Erick Medeiros"
	When I fill in "Matrícula" with "11123456"
	And I press input "Salvar"
	Then I should be on the Candidatos page
	And I should see "O candidato Erick Medeiros não foi modificado pois já existe."
#end
