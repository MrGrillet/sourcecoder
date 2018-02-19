class AdminController < ApplicationController

  def index
  	@companies = Company.all
  end

  def elements
  end
end
