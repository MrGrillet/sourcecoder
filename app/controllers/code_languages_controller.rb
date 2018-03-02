class CodeLanguagesController < ApplicationController
	before_action :set_lang, only: [:edit, :update, :show, :destroy]


	def index
		@code_languages = CodeLanguage.all
	end

	def new
		@code_language = CodeLanguage.new
	end

	def create
		@code_language = CodeLanguage.new(code_language_params)
		if @code_language.save
			flash[:success] = "Language was successfully added"
			redirect_to code_languages_path
		else
			render 'new'
			
		end
	end

	def show
		
	end

	def update
		if @language.update(code_language_params)
			flash[:success] = "Language was successfully updated"
			redirect_to code_languages_path
		else
			render 'edit'
		end
	end

	def edit
		
	end

	private

		def code_language_params
			params.require(:code_language).permit(:name, :colour_r, :colour_g, :colour_b, :colour_opacity)
		end
		
		def set_lang
			@language = CodeLanguage.find(params[:id])
		end

end