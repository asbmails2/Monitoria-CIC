class CriarProfessor < ActiveRecord::Migration[5.0]
  def change
    create_table 'professors' do |t|
      t.string 'nome'
      t.string 'email'
      t.string 'sala'
      t.timestamps #Manter rastro de criação/modificação
      t.integer 'id' #relacionar com o usuário.
    end
  end
end
