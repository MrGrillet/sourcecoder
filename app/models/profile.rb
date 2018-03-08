class Profile < ActiveRecord::Base
	# belongs_to :user
	has_many :previous_jobs, dependent: :destroy
	has_many :experiences, through: :previous_jobs
	accepts_nested_attributes_for :previous_jobs, allow_destroy: true
	accepts_nested_attributes_for :experiences

	def self.search(term)
		if term
			where("profile_bio ilike :q or profile_objective ilike :q or profile_additional_notes ilike :q", q: "%#{term}%")
		else
			all
		end
	end
end
