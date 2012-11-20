class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def ip_protect
    if Rails.env.production? 
      @ip = "76.19.119.28"
      unless @ip == request.remote_ip
        flash[:error] = "You are not authorized"
        redirect_to root_path
      end
    end
  end
end
