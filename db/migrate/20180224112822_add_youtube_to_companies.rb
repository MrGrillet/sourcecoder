class AddYoutubeToCompanies < ActiveRecord::Migration[5.1]
  def change
  	add_column :companies, :company_youtube, :string
  end
end
