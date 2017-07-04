class AddRolesToInserirCandidatos < ActiveRecord::Migration[5.0]
  def change
    add_column :candidatos, :id_of_user, :integer, default: 0
  end
end
