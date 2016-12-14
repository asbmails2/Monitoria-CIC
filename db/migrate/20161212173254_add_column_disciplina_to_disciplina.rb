class AddColumnDisciplinaToDisciplina < ActiveRecord::Migration[5.0]
  def change
    add_column :disciplinas, :disciplina, :string
  end
end