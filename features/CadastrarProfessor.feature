Feature: Cadastrar professor da disciplina

#if ($Cadastrar professor)
Scenario: Cadastrar professor
	Given I am on the Monitoria CiC home page
	When I follow "Cadastrar Professor"
	Then I should be on the Cadastrar Professor page
	When I fill in "Nome" with "Professor 01"
	And I select "Disciplina 1" from "Disciplina"
	And I press "Salvar"
	Then I should be on the Monitoria CiC home page
	And I should see "Professor 01"
#end
