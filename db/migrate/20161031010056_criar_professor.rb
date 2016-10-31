class CriarProfessor < ActiveRecord::Migration[5.0]
  def change
    create_table 'professors' do |t|
      t.string 'nome'
      t.string 'disciplina'
      t.timestamps #Manter rastro de criação/modificação
    end
  end
end