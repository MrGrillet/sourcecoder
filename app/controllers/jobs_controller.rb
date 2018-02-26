class JobsController < ApplicationController
	before_action :set_job, only: [:edit, :update, :show, :destroy]
	skip_before_action :authenticate_user!, only: [:index, :show]

	def index
		# @jobs = Job.all	
		@code_languages = CodeLanguage.all
		@jobs = Job.search(params[:term])
	end

	def new
		@job = Job.new
		@code_languages = CodeLanguage.all
		@user_id = current_user
		@company_id = Company.find_by(user_id: current_user)[:id]
	end

	def edit
		@code_languages = CodeLanguage.all
	end

	def create
		@job = Job.new(job_params)
		@job.user = current_user
		@job.company_id = Company.find_by(user_id: current_user)[:id]
		if @job.save
			flash[:success] = "Job was successfully created"
			redirect_to job_path(@job)
		else
			render 'new'
		end
	end


	def show
		@jobs = Job.all
		@company_name = Company.find(@job.company_id)[:company_name]
		@company_url = Company.find(@job.company_id)[:company_url]
		@company_github = Company.find(@job.company_id)[:company_github]
		@company_facebook = Company.find(@job.company_id)[:company_facebook]
		@company_twitter = Company.find(@job.company_id)[:company_twitter]
		@company_logo = Company.find(@job.company_id)[:logo_url]
	end

	def update
		if @job.update(job_params)
			flash[:success] = "Job was successfully updated"
			redirect_to job_path(@job)
		else
			render 'edit'
		end
	end

	def destroy
		@job.destroy
		flash[:danger] = "Job post was deleted"
		redirect_to jobs_path
	end


	
	private

		def set_job
			@job = Job.find(params[:id])
		end
		
		def job_params
			params.require(:job).permit(:title, :description, :location, :salary, :company_id, :user, :benefits, :tech_stack, :skills_ideal, :skills_essential, :applicant_background, :the_role, :term, code_language_ids:[])
		end

end