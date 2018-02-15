class JobsController < ApplicationController
	before_action :set_job, only: [:edit, :update, :show, :destroy]

	def index
		@jobs = Job.all	
	end

	def new
		@job = Job.new
	end

	def edit
	end

	def create
		@job = Job.new(job_params)
		if @job.save
			flash[:notice] = "Job was successfully created"
			redirect_to job_path(@job)
		else
			render 'new'
		end
	end

	def show
	end

	def update
		if @job.update(job_params)
			flash[:notice] = "Job was successfully created"
			redirect_to job_path(@job)
		else
			render 'edit'
		end
	end

	def destroy
		@job.destroy
		flash[:notice] = "Job post was deleted"
		redirect_to jobs_path	
	end
	
	private

		def set_job
			@job = Job.find(params[:id])
		end

		def job_params
			params.require(:job).permit(:title, :description, :location)
		end

end