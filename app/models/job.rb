class Job < ActiveRecord::Base
	belongs_to :user
	
	has_many :job_languages
	has_many :code_languages, through: :job_languages
	#validates :user_id, presance: true

	
end
