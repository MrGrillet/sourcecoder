module ApplicationHelper

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

end
