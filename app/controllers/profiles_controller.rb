class ProfilesController < ApplicationController
	before_action :set_profile, only: [:edit, :update, :show, :destroy]

	def index
		@profiles = Profile.all		
	end

	def new
		@profile = Profile.new
		@profiles = Profile.all	
		@profile.previous_jobs.build


	end

	def edit
		@profiles = Profile.all	
		@profile.previous_jobs.build
	end

	def create
		@profile = Profile.new(profile_params)
		user = current_user.id
		if @profile.save
			flash[:success] = "Your profile was successfully created"
			redirect_to profile_path(@profile)
		else
			render 'new'
		end
	end


	def show
		@work_history = PreviousJob.find_by(profile_id: @profile)

		if User.find(current_user.id) == "applicant"
			@profile = current_user.id
			user_id = current_user.id
		end
		
	end

	def update
		if @profile.update(profile_params)
			flash[:success] = "Your profile was successfully updated"
			redirect_to profile_path(@profile)
		else
			render 'edit'
		end
	end

	def destroy
		@profile.destroy
		flash[:danger] = "Profile was deleted"
		redirect_to profile_path
	end


	private

		def set_profile
			@profile = Profile.find(params[:id])
		end


		def profile_params
			params.require(:profile).permit(:profile_bio, :profile_objective, :profile_additional_notes, :profile_url, :profile_phone_number, :user, :profile_twitter, :profile_github, :profile_linkedin, :profile_featured, :profile_youtube, :profile_image, :profile_wallpaper, :user_id, previous_jobs_attributes: PreviousJob.attribute_names.map(&:to_sym).push(:_destroy))
		end
end