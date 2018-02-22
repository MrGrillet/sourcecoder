class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
    	t.integer :application_id
    	t.string :application_title
    	t.text :application_body
    	t.string :profile_url
    	t.boolean :profile_featured
    end
  end
end
