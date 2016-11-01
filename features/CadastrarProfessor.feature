Feature: Cadastrar professor da disciplina

#if ($Cadastrar Professor Happy Path GUI)
Scenario: Cadastrar Professor Happy Path GUI
	Given I am on the Monitoria CiC home page
	When I follow "Cadastrar Professor"
	Then I should be on the Cadastrar Professor page
	When I fill in "Nome" with "Professor 01"
	And I select "Disciplina 1" from "Disciplina"
	And I press "Salvar"
	Then I should be on the Monitoria CiC home page
	And I should see "Professor 01 incluído com sucesso na disciplina Disciplina 1."
#end

#if ($Cadastrar Professor Sad Path Controller)
Scenario: Cadastrar Professor Sad Path Controller
	Given I am on the Monitoria CiC home page
	When I follow "Cadastrar Professor"
	Then I should be on the Cadastrar Professor page
	When I fill in "Nome" with "Professor 01"
	And I select "Disciplina 1" from "Disciplina"
	And I press "Salvar"
	Then I should be on the Monitoria CiC home page
	And I shouldn see "Erro ao incluir Professor 01. Professor já existente."
#end
