class AddRolesToDiciplinas < ActiveRecord::Migration[5.0]
  def change
    add_column :disciplinas, :ativa, :boolean, default: nil
  end
end
