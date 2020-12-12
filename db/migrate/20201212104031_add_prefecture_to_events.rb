class AddPrefectureToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :prefecture, :integer, null: false, default: 0
  end
end
