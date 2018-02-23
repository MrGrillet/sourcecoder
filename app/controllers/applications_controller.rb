class ApplicationsController < ApplicationController
	before_action :set_application, only: [:edit, :update, :show, :destroy]
	before_action :set_job, only: [:new, :create]

	def index
		@applications = Application.all
	end

	
	def new
		@job_title = Job.find(@job)[:title]
		@job_id = Job.find(@job)[:id]
		@user_id = current_user.id
		@application = Application.new
	end
		
	def create
		@application = Application.new(application_params)
		@user_id = current_user.id
		if @application.save
			flash[:success] = "Application saved"
			redirect_to application_path(@application)
		else
			render 'new'
		end
	end

	def edit
		@applications = Application.all
	end

	def update
		@user_id = current_user.id
		if @application.update(application_params)
			flash[:success] = "Your application was successfully updated"
			redirect_to applications_path
		else
			render 'edit'
		end
	end

	def show
	end

	def destroy
		@application.destroy
		flash[:danger] = "Application deleted"
		redirect_to applications_path
	end

	private 

		def set_application
			@application = Application.find(params[:id])
		end

		def set_job
			@job = params['job_id']
		end
	
		def application_params
			params.require(:application).permit(:application_body, :job_id, :user_id, :youtube_url)
		end
end