class AddUserIdToApplications < ActiveRecord::Migration[5.1]
  def change
  	add_column :applications, :user_id, :integer
  	add_column :applications, :youtube_url, :string
  end
end
