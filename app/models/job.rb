class Job < ActiveRecord::Base
	belongs_to :user
	
	has_many :job_languages
	has_many :code_languages, through: :job_languages
	#validates :user_id, presance: true

	def self.search(term)
		if term
			where("title ilike :q or description ilike :q or the_role ilike :q or location ilike :q or applicant_background ilike :q or skills_essential ilike :q or skills_ideal ilike :q or tech_stack ilike :q or benefits ilike :q", q: "%#{term}%")
		else
			all
		end
	end
end



    
