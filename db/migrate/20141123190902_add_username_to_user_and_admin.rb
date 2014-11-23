class AddUsernameToUserAndAdmin < ActiveRecord::Migration
  def change
      add_column :users, :username, :string
      add_column :admins, :username, :string
  end
end
