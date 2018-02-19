class AddStraplineToCompanies < ActiveRecord::Migration[5.1]
  def change
  	add_column :companies, :company_strapline, :string
  end
end
