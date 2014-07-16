class SearchSuggestionsController < ApplicationController

	def index
    	render json: %w[chittagong sylhet dhaka]
  	end
end
