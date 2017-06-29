class AddRolesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin_role, :boolean
    add_column :users, :professor_role, :boolean
    add_column :users, :student_role, :boolean
  end
end
