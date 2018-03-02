class ChangeApplicationsToJobApplications < ActiveRecord::Migration[5.1]
  def change
  	rename_table :applications, :job_applications
  end
end
