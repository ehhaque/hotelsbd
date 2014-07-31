class SearchController < ApplicationController
  def index
  	 @search = Room.search(params[:q])
       
  end

  def search
  	#UserMailer.reserve_confirmation.deliver
  	UserMailer.email_name.deliver
  	@search = Room.search(params[:q])
    @rooms = @search.result.includes(:hotel).paginate(page: params[:page])      

  end
end
