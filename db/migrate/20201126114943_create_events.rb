class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_name, null: false
      t.date :datetime, null: false
      t.string :place, null: false
      t.integer :reward, null: false
      t.text :detail, null: false
      t.integer :recruiter_id
      t.integer :applicant_id
      t.timestamps
    end
  end
end
