class AddGenreToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :genre, :string, null: false
  end
end
