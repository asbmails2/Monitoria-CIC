class AddColumnProfessorToProfessor < ActiveRecord::Migration[5.0]
  def change
    add_column :professors, :professor, :string
  end
end