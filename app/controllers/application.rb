# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '078533f518536dca9a7df88847852494'
  
  before_filter :set_locale
  
  def update_locale
    unless params[:locale].nil?
      set_locale
      
      redirect = params[:redirect].split('/')
      redirect.delete_at(1)
      @redirect = redirect.join('/')
      @redirect = "/#{@locale}#{@redirect}"
    
      respond_to do |format|
        format.js
      end
    end
  end

private

  def set_locale
    if !params[:locale].nil? && LOCALES.keys.include?(params[:locale])
      Locale.set LOCALES[params[:locale]]
      @locale = params[:locale]
    else
      @locale = 'en'
      redirect_to home_path(:locale => 'en')
    end
  end
  
end
