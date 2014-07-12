class SearchController < ApplicationController
  def index
  	 @search = Room.search(params[:q])
     @rooms = @search.result()

    
    #@rooms = Room.paginate(page: params[:page])
  end
end
