class CreateCompany < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
    	t.string :company_name
    	t.text :company_description
    	t.string :company_url
    	t.string :company_twitter
    	t.string :company_facebook
    	t.string :company_github
    	t.timestamps
    end
  end
end
