class JobsController < ApplicationController

	def new
		@job = Job.new
	end

	def create
		#render plain: params[:job].inspect
		@job = Job.new(job_params)
		@job.save
		redirect_to jobs_show(@job)
	end

	def show
		
	end


	
private
	def job_params
		params.require(:job).permit(:title, :description, :location)
		
	end

end
