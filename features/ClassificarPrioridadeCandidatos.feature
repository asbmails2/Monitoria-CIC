Feature: classificar candidatos por prioridade


	Como professor,
	Quero classificar a prioridade dos alunos candidatos a monitoria,
	pode envolver os candidatos voluntários e remunerados.
	E assim selecionar os candidatos mais adequados.

Background: candidatos in database

  Given the following candidatos exist:
  | nome | | matricula | | monitoria | | semestre | | prioridade |
  | Mateus Andrade | | 10123456 | | Remunerada | | 3 | | 6 |
  | Erick Medeiros | | 11123456 | | Voluntaria | | 4 | | 0 |
  | Simone Garcia | | 12123456 | | Voluntaria | | 5 | | 0 |
  | Jessica Esteves | | 13123456 | | Remunerada | | 6 | | 10 |

Scenario: classificar prioridade do aluno
  When I go to the edit page for "Erick Medeiros"
  Then I should see "0"
  And  I fill in "Prioridade" with "8"
  And  I press "Salvar"
  Then the prioridade of "Erick Medeiros" should be "0"

Scenario: editar classificação de prioridade do aluno
  Given I am on the details page for "Star Wars"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Star Wars"
  And   I should see "THX-1138"
  But   I should not see "Blade Runner"
