class RemoveApplicantIdFromEntries < ActiveRecord::Migration[6.0]
  def change
    remove_column :entries, :applicant_id, :integer
  end
end
