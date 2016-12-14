class Disciplina < ActiveRecord::Base
	require 'csv'
	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			Disciplina.create! row.to_hash
		end
	end
<<<<<<< HEAD

end
=======
end
>>>>>>> ef1dde9340b78b8e22bd4b6a8702931d6eb9b577
