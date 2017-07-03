class InserirCandidatos < ActiveRecord::Migration[5.0]
  def change
	  create_table 'candidatos' do |t|
		  t.string 'nome'
		  t.string 'matricula'
		  t.string 'disciplina'
		  t.string 'monitoria'
		  t.integer 'semestre'
		  t.integer 'prioridade'
		  t.timestamps
      t.integer 'id' #relacionar com o usuário
	   end
  end
end
