
# Monitoria@CIC
Projeto da disciplina de Engenharia de Software 2/2016 para gerenciar as bolsas de monitoria, é composto
por as seguintes classes:
  
  * Disciplinas: CRUD da oferta de bolsas, seleciona-se a disciplina a ser ofertada, o professor 
  que está ofertando a bolsa de monitoria e o número de vagas disponíveis.
  
  * Disciplinas_cadastradas: gerencia o resultado do crawler, na tabela disciplinas_cadastradas estao todas 
  as disciplinas ofertadas pelo CiC no semestre
  
  * Professores: gerencia o cadastro de professores, e exibe os professores cadastrados e assim é possivel 
  selecionar um professor para ofertar uma bolsa de monitoria
  
  *Inscricao de candidatos: cadastro de candidato que desejam se aplicar a monitoria de um certa disciplina
  
Para rodar os testes é necessário criar o banco de dados e inicializa-lo:
  $ rake db:migrate RAILS_ENV=test
  $ rake db:seed RAILS_ENV=test

E executar o cucumber e rspec
  $ bundle exec rake cucumber
  $ rspec spec
  
E para rodar a aplicaçâo é preciso executar:
  $ rake db:migrate
  $ rake db:seed
  $ rails server
