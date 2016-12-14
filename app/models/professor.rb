# Link da classe Professor com o modelo de dados da tabela professor

class Professor < ActiveRecord::Base
		require 'csv'
	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			Professor.create! row.to_hash
		end
	end
end
