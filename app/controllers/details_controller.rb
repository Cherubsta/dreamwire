class DetailsController < ApplicationController

	def index
		@dream = Dream.find(params[:dream_id])	
	end
end
