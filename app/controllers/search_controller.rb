class SearchController < ApplicationController
  def index
  	 @search = Room.search(params[:q])
     #@rooms = @search.result()
     @rooms = @search.result.includes(:hotel).page(params[:page])

    
    #@rooms = Room.paginate(page: params[:page])
  end
end
