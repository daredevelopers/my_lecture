class AddAccessTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :access_type, :string
  end
end
