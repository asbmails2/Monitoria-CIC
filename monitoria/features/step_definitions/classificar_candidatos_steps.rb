Given /^the following candidatos exist:$/ do |candidatos_table|
  candidatos_table.hashes.each do |candidato|
    Candidato.create candidato
  end
end

Then /^the prioridade of "([^"]*)" should be "([^"]*)"$/ do |candidato_nome, candidato_prioridade|
  candidato = Candidato.find_by_title candidato_nome
  candidato.prioridade.should == candidato_prioridade
end
