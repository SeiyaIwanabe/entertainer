class RemoveGenreFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :genre, :string
  end
end
