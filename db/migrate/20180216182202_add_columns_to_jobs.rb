class AddColumnsToJobs < ActiveRecord::Migration[5.1]
  def change
  	add_column :jobs, :user_id, :integer
  	add_column :jobs, :salary, :string
  	add_column :jobs, :featured, :boolean
  	add_column :jobs, :posted_date, :date
  	add_column :jobs, :code_languages, :integer
  	add_column :jobs, :aplications, :integer
  	add_column :jobs, :company, :integer
  	add_column :jobs, :start_date, :date
  end
end
