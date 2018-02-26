module ApplicationHelper

  def link_to_add_row(name, f, association, **args)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |p|
      render(association.to_s.singularize + "_fields", f: p)
    end
    link_to(name, '#', class: "add_fields " + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
  end

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
