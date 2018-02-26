class Profile < ActiveRecord::Base
	#	belongs_to :user	
	has_many :previous_jobs, dependent: :destroy
	accepts_nested_attributes_for :previous_jobs, allow_destroy: true
end
