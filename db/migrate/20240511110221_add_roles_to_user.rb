class AddRolesToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :roles, :json
  end
end
