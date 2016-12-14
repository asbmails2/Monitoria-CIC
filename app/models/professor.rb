# Link da classe Professor com o modelo de dados da tabela professor

class Professor < ActiveRecord::Base
<<<<<<< HEAD
		require 'csv'
=======
	require 'csv'
>>>>>>> ef1dde9340b78b8e22bd4b6a8702931d6eb9b577
	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			Professor.create! row.to_hash
		end
	end
<<<<<<< HEAD
end
=======
end
>>>>>>> ef1dde9340b78b8e22bd4b6a8702931d6eb9b577
