class RemoveDatetimeFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :datetime, :date
  end
end
