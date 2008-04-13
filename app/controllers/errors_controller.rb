class ErrorsController < ApplicationController

	def index
		@location = {:lon => 0.60769, :lat => 46.36152, :zoom => 6}
		@errors = Error.find(:all,
		                      :conditions => "lon > -5.23 AND lon < 8.49 AND lat > 42.69 AND lat < 49.8",
		                      :order => "created_at DESC", :limit => 1)	
	end
	
	def new
	  @location = {:lon => 0.60769, :lat => 46.36152, :zoom => 6}
	  @error = Error.new
	end
	
	def create
	  @error = Error.new(params[:error])
	  
	  if @error.save
	    @message = "Saved!"
	  else
	    @message = "Error: not saved!"
	  end
	  
	  respond_to do |format|
      format.js
    end
	end

  def update_markers
    left = params[:left]
    bottom= params[:bottom]
    right = params[:right]
    top = params[:top]
    if params[:zoom].to_i >= 13
      @errors = Error.find(:all,
		                      :conditions => "lon > #{left} AND lon < #{right} AND lat > #{bottom} AND lat < #{top}")
		else
		  @errors = Error.find(:all,
		                      :conditions => "lon > #{left} AND lon < #{right} AND lat > #{bottom} AND lat < #{top}",
		                      :order => "created_at DESC", :limit => 3)
		end
		
		respond_to do |format|
      format.js
    end
  end
end
