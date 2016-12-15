class ListaDisciplinas < ActiveRecord::Migration[5.0]
  def change
  	create_table :lista_disciplinas do |t|
      t.string :nome
      t.string :codigo
      t.timestamps
    end
  end
end
