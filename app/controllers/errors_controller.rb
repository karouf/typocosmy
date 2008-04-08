class ErrorsController < ApplicationController

	def index
		@location = {:lon => 3.0906, :lat => 45.7694, :zoom => 13}
		@markers = Error.find(:all)	
	end

end
