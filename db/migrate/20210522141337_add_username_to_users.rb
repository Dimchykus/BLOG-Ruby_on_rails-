class AddUsernameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column  :username, :string
    add_index :username, unique: true, default: ""
  end
end
