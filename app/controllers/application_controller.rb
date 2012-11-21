class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery
  
  protected
      def authenticate
        authenticate_or_request_with_http_basic do |username, password|
          username == "tergas" && password == "1Houdini!"
        end
      end
end
