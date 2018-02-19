class AddWallpaperToCompanies < ActiveRecord::Migration[5.1]
  def change
  	add_column :companies, :wallpaper_url, :string
  end
end
