class CreatePreviousJob < ActiveRecord::Migration[5.1]
  def change
    create_table :previous_jobs do |t|
    	t.text :previous_job_description
		t.string :previous_job_title
		t.string :previous_company_name
    	t.timestamps
    end
  end
end
