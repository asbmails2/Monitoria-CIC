class AddRolesToProfessores < ActiveRecord::Migration[5.0]
  def change
    add_column :professores, :id_of_user, :integer, default: 0
  end
end
