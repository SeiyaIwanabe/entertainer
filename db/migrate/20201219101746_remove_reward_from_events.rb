class RemoveRewardFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :reward, :integer
  end
end
