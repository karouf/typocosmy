class ErrorsController < ApplicationController

	def index
		@location = {:lon => 3.0906, :lat => 45.7694, :zoom => 13}
		@errors = Error.find(:all, :order => "created_at DESC", :limit => 3)	
	end

end
