class PagesController < ApplicationController
  before_action :authenticate_user!, only: [
    :inside
  ]

  def home
  end
  
  def inside
  	redirect_to root_path
  end 
    
end
