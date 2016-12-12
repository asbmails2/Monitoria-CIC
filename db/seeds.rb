disciplinas = [
  {:nome => 'Disciplina 1', :codigo => 'cic01',
    :professor => 'Professor 1', :vagas => 3},
  {:nome => 'Disciplina 2', :codigo => 'cic02',
    :professor => 'Professor 2', :vagas => 2}
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
