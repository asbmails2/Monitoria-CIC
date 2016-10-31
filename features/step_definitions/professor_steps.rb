Given /^the following professores exist:$/ do |professores_table|
  professores_table.hashes.each do |professor|
    Professor.create!(professor)
  end
end
