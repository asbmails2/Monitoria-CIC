disciplinas = [
  {:nome => 'Disciplina 1', :codigo => 'cic01',
    :professor => 'Professor 1', :vagas => 3},
  {:nome => 'Disciplina 2', :codigo => 'cic02',
    :professor => 'Professor 2', :vagas => 2},
  {:nome => 'Disciplina 2', :codigo => 'cic02',
    :professor => 'Professor 1', :vagas => 2}
]

disciplinas.each do |disciplina|
  Disciplina.create!(disciplina)
end

ofertas = [
  {:nome => 'Disciplina 1', :codigo => 'cic01'},
  {:nome => 'Disciplina 2', :codigo => 'cic02'}
]

ofertas.each do |oferta|
  Oferta.create!(oferta)
end

professores = [
  {:nome => 'Professor 1', :email => "professor1@unb.br", :sala => "Sala A1-1-1"},
  {:nome => 'Professor 2', :email => "professor2@unb.br", :sala => "Sala A2-2-2"}
]

professores.each do |professor|
  Professor.create!(professor)
end

candidatos = [
	{:nome => 'Mateus Andrade', :matricula => '10123456', :monitoria =>'Remunerada', :semestre => 3, :prioridade => 0},
	{:nome => 'Erick Medeiros', :matricula => '11123456', :monitoria =>'Voluntaria', :semestre => 4, :prioridade => 0},
	{:nome => 'Simone Garcia', :matricula => '12123456', :monitoria =>'Voluntaria', :semestre => 5, :prioridade => 0},
	{:nome => 'Jessica Esteves', :matricula => '13123456', :monitoria =>'Remunerada', :semestre => 6, :prioridade => 0}
]

candidatos.each do |candidato|
	Candidato.create!(candidato)
end
