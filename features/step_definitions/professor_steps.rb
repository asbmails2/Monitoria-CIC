Given /^the following professores exist:$/ do |professors_table|
  professors_table.hashes.each do |professor|
    Professor.create!(professor)
  end
end
