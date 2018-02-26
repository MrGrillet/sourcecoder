class AddIdToPreviousJob < ActiveRecord::Migration[5.1]
  def change
  	add_column :previous_jobs, :profile_id, :integer
  	
  end
end
