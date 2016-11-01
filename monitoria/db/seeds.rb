# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Seed the RottenPotatoes DB with some movies.
more_candidatos = [
	{:nome => 'Mateus Andrade', :matricula => '10123456', :monitoria =>'Remunerada', :semestre => 3, :prioridade => 0},
	{:nome => 'Erick Medeiros', :matricula => '11123456', :monitoria =>'Voluntaria', :semestre => 4, :prioridade => 0},
	{:nome => 'Simone Garcia', :matricula => '12123456', :monitoria =>'Voluntaria', :semestre => 5, :prioridade => 0},
	{:nome => 'Jessica Esteves', :matricula => '13123456', :monitoria =>'Remunerada', :semestre => 6, :prioridade => 0}
]

more_candidatos.each do |candidato|
	Candidato.create!(candidato)
end
