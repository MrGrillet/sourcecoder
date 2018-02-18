class HomeController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index]
	
  def index
  	@code_languages = CodeLanguage.all
  end
end
