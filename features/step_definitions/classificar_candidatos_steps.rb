Given /^the following candidatos exist:$/ do |candidatos_table|
  candidatos_table.hashes.each do |candidato|
    Candidato.create!(candidato)
  end
end
