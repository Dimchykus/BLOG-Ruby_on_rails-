class AddUsernameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column  :username, :string, null: false, default: ""
    add_index :username, null: false, default: "", unique: true
  end
end
