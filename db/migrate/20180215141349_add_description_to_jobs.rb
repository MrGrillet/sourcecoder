class AddDescriptionToJobs < ActiveRecord::Migration[5.1]
  def change
  	add_column :jobs, :description, :text
  	add_column :jobs, :created_at, :datetime
  	add_column :jobs, :updated_at, :datetime
  	add_column :jobs, :location, :string
  	add_column :jobs, :company_id, :integer
  end
end
