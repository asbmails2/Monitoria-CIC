disciplinas = [
  {:nome => 'Disciplina 1', :codigo => 'cic01',
    :professor => 'Professor 1'},
  {:nome => 'Disciplina 2', :codigo => 'cic02',
    :professor => 'Professor 2'}
]

disciplinas.each do |disciplina|
  Disciplina.create!(disciplina)
end

professores = [
  {:nome => 'Professor 1', :email => "professor1@unb.br", :sala => "Sala A1-1-1"}
]
professores = [
  {:nome => 'Professor 2', :email => "professor2@unb.br", :sala => "Sala A1-1-2"}
]

professores.each do |professor|
  Professor.create!(professor)
end