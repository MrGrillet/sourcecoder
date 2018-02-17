class Job < ActiveRecord::Base
	belongs_to :user

	#validates :user_id, presance: true

	
end
