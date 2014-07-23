class SearchController < ApplicationController
  def index
  	 @search = Room.search(params[:q])
       
  end

  def search
  	@search = Room.search(params[:q])
    @rooms = @search.result.includes(:hotel).paginate(page: params[:page])      

  end
end
