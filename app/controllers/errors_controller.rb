require 'geoip'

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
	  lon = params[:lon].to_f
	  lat = params[:lat].to_f
	  
	  @error.location = Point.from_lon_lat(lon, lat)
	  
	  @error.author_ip = request.remote_ip
	  @error.user = current_user
	  
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
      begin
        geoip = GeoIP.new("#{RAILS_ROOT}/app/geoip/GeoLiteCity.dat")
        remote = geoip.city(request.remote_ip)
        if remote[10] > 180 || remote[10] < -180 || remote[9] > 90 || remote[9] < -90
          location = {:lon => 0, :lat => 0, :zoom => 1}
        else
          location = {:lon => remote[10], :lat => remote[9], :zoom => 6}
        end
      rescue
        location = {:lon => 0, :lat => 0, :zoom => 1}
      end
    end
    return location
  end
  
end
