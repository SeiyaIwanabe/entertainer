class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.references :event, null: false, foreign_key: true, index: false
      t.integer :applicant_id
      t.timestamps
    end
    add_index :entries, %i[event_id applicant_id], unique: true
  end
end
