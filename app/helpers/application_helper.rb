module ApplicationHelper

	def admin_user?
		if current_user.user_type == "admin"
			true
		else
			false
		end 
	end
	

	def employer?
		if current_user.user_type == "employer"
			true
		else
			false
		end 
	end

	def applicant?
		if current_user.user_type == "applicant"
			true
		else
			false
		end 
	end

end
