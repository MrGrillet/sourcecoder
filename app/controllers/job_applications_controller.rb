class JobApplicationsController < ApplicationController
	before_action :set_application, only: [:edit, :update, :show, :destroy]
	before_action :set_job, only: [:new, :create]

	def index
		@applications = JobApplication.all
		@jobs = Job.all
	end

	
	def new
		@job_title = Job.find(@job)[:title]
		@job_description = Job.find(@job)[:description]
		@job_id = Job.find(@job)[:id]
		@user_id = current_user.id
		@application = JobApplication.new
	end
		
	def create
		@application = JobApplication.new(application_params)
		@user_id = current_user.id
		if @application.save
			flash[:success] = "Application saved"
			redirect_to job_application_path(@application)
		else
			render 'new'
		end
	end

	def edit
		@applications = JobApplication.all
	end

	def update
		@user_id = current_user.id
		if @application.update(application_params)
			flash[:success] = "Your application was successfully updated"
			redirect_to job_applications_path
		else
			render 'edit'
		end
	end

	def show
		@applicant = User.find(@application.user_id)
		@applicant_profile = Profile.find_by(user_id: @application.user_id)
	end

	def destroy
		@application.destroy
		flash[:danger] = "Application deleted"
		redirect_to job_applications_path
	end

	private 

		def set_application
			@application = JobApplication.find(params[:id])
		end

		def set_job
			@job = params['job_id']
		end
	
		def application_params
			params.require(:job_application).permit(:application_body, :job_id, :user_id, :youtube_url)
		end
end