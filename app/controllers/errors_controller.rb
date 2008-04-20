class ErrorsController < ApplicationController

	def index
		@location = location_from_params(params)
	end
	
	def new
	  @location = location_from_params(params)
	  @error = Error.new
	end
	
	def create
	  @error = Error.new(params[:error])
	  lon = params[:lon]
	  lat = params[:lat]
	  
	  @error.location = Point.new(lon, lat)
	  
	  if @error.save
	    @saved = true
	  else
	    @saved = false
	  end
	  
	  respond_to do |format|
      format.js
    end
	end

  def update_markers
    left = params[:left]
    bottom = params[:bottom]
    right = params[:right]
    top = params[:top]
    if params[:zoom].to_i >= 13
		  @errors = Error.find_all_by_location([[left, bottom], [right, top]])
		else
		  @errors = Error.find_all_by_location([[left, bottom], [right, top]], :order => "created_at DESC", :limit => 10)
		end
		
		respond_to do |format|
      format.js
    end
  end
  
private

  def location_from_params(params)
    if params[:lon] && params[:lat] && params [:zoom]
      location = { :lon => params[:lon], :lat => params[:lat], :zoom => params[:zoom] }
    else
      location = {:lon => 0.60769, :lat => 46.36152, :zoom => 6}
    end
    return location
  end
  
end
