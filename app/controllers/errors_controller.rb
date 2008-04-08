class ErrorsController < ApplicationController

	def index
		@location = {:lon => 3.0906, :lat => 45.7694, :zoom => 13}
		
		@markers = [{:lon => 3.1173, :lat => 45.7935},
						{:lon => 3.0852, :lat => 45.7784},
						{:lon => 3.1022, :lat => 45.7623},
						{:lon => 3.0758, :lat => 45.7444},
						{:lon => 3.1123, :lat => 45.7693}
					]
					
		
	end
end
