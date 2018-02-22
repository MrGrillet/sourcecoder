class AddJobIdToApplications < ActiveRecord::Migration[5.1]
  def change
  	add_column :applications, :job_id, :integer
  	add_column :applications, :created_at, :datetime, null: false
    add_column :applications, :updated_at, :datetime, null: false
  end
end
