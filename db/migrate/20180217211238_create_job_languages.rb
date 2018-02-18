class CreateJobLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :job_languages do |t|
    	t.integer :job_id
    	t.integer :code_language_id
    end
  end
end
