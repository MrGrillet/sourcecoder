class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
    	t.text :profile_bio
    	t.text :profile_objective
    	t.text :profile_additional_notes
    	t.string :profile_url
        t.string :profile_phone_number
    	t.string :profile_twitter
    	t.string :profile_facebook
    	t.string :profile_github
    	t.string :profile_linkedin
		t.boolean :profile_featured
    	t.timestamps
    end
  end
end
