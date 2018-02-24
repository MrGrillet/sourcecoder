class CompaniesController < ApplicationController
	before_action :set_company, only: [:edit, :update, :show, :destroy]
	skip_before_action :authenticate_user!, only: [:show, :index]
	

	def index
		@companies = Company.all
	end

	def create
		@company = Company.new(company_params)
		@company.user = current_user
		if @company.save
			flash[:success] = "Company was successfully created"
			redirect_to company_path(@company)
		else
			render 'new'
		end
		
	end

	def new
		@company = Company.new
		@code_languages = CodeLanguage.all
	end

	def destroy
		@company.destroy
		flash[:danger] = "Company was deleted"
		redirect_to companies_path
	end

	def update
		if @company.update(company_params)
			flash[:success] = "Company was successfully updated"
			redirect_to company_path(@company)
		else
			render 'edit'
		end
	end

	def show
		@jobs = Job.all
		
	end

	def edit
		
	end

	private
		def set_company
			@company = Company.find(params[:id])
		end

		
		def company_params
			params.require(:company).permit(:company_name, :company_description, :company_url, :company_twitter, :company_facebook, :company_youtube, :company_github, :user_id, :logo_url, :wallpaper_url, :company_strapline, :location )
		end

end