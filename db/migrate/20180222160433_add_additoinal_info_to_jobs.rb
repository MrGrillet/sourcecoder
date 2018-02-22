class AddAdditoinalInfoToJobs < ActiveRecord::Migration[5.1]
  def change
  	 add_column :jobs, :the_role, :text
  	 add_column :jobs, :applicant_background, :text
  	 add_column :jobs, :skills_essential, :text
  	 add_column :jobs, :skills_ideal, :text
  	 add_column :jobs, :tech_stack, :text
  	 add_column :jobs, :benefits, :text
  end
end
