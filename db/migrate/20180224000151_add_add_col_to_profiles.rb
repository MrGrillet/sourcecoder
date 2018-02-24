class AddAddColToProfiles < ActiveRecord::Migration[5.1]
  def change
  	add_column :profiles, :profile_youtube, :string
  	add_column :profiles, :profile_image, :string
  	add_column :profiles, :profile_wallpaper, :string
  	add_column :profiles, :user_id, :integer
  end
end
