disciplinas = [
  {:nome => 'Disciplina 1', :codigo => 'cic01',
    :professor => nil},
  {:nome => 'Disciplina 2', :codigo => 'cic02',
    :professor => nil}
]

disciplinas.each do |disciplina|
  Disciplina.create!(disciplina)
end

professores = [
  {:nome => 'Professor 1', :disciplina => nil}
]

professores.each do |professor|
  Professor.create!(professor)
end