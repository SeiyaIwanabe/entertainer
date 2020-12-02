class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :icon, :string
    add_column :users, :introduction, :text
    add_column :users, :genre, :string
  end
end
