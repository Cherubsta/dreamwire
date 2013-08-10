class DetailsController < ApplicationController

	def index
		@pin = Pin.find(params[:pin_id])	
	end
end
