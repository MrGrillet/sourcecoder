class AddFeaturedToCompanies < ActiveRecord::Migration[5.1]
  def change
  	add_column :companies, :featured, :boolean
  end
end
