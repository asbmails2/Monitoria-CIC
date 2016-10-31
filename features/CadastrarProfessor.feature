Feature: Cadastrar professor da disciplina

Scenario: Cadastrar professor
	Given I am on the MonitoriaCic home page
	When I follow "Cadastrar professor"
	Then I should be on the Cadastrar Professor em Disciplina page
	When I fill in "Nome" with "Professor 01"
	And I select "Disciplina 1" from "Disciplina"
	And I press "Salvar"
	Then I should be on the MonitoriaCic home page
	And I should see "Professor BDD Teste"
