class CreateDisciplinas < ActiveRecord::Migration[5.0]
  def change
    create_table :disciplinas do |t|
      t.string :nome
      t.string :codigo
      t.string :professor
      t.integer :vagas

      t.timestamps
    end
  end
end
