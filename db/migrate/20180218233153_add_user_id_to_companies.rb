class AddUserIdToCompanies < ActiveRecord::Migration[5.1]
  def change
  	add_column :companies, :user_id, :integer
  	add_column :companies, :location, :string
  	add_column :companies, :code_languages, :integer
  	add_column :companies, :logo_url, :string
  end
end
