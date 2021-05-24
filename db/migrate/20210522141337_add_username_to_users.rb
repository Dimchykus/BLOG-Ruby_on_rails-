class AddUsernameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column  :username, :string, default: ""
    add_index :username, unique: true
  end
end
