class AdminController < ApplicationController

  def index
  	@companies = Company.all
  end
end
