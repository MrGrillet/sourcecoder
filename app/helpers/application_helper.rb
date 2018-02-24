module ApplicationHelper

	def current_user_profile_id
		the_profile = Profile.find_by(user_id: current_user.id)
		@current_user_profile_id = the_profile.id
	end

	def admin_user?
		if current_user && current_user.user_type == "admin"
			true
		else
			false
		end 
	end

	def job_owner?
		 # Not working. Can't work out why

		if current_user && current_user.id == job.user_id
			true
		else
			false
		end 
		
	end
	

	def employer?
		if current_user && current_user.user_type == "employer"
			true
		else
			false
		end 
	end

	def applicant?
		if current_user && current_user.user_type == "applicant"
			true
		else
			false
		end 
	end

	def user_id
	 current_user.id
	end

		def company_id
			@company_id = Company.find_by(user: current_user.id)[:id]
			
		end

end
