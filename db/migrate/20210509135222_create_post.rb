class CreatePost < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :likes, :null => false, :default => 0

    end
  end
end
