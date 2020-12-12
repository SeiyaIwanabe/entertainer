class RemovePlaceFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :place, :string
  end
end
