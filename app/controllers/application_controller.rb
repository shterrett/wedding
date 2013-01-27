class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery
  
  protected
      def authenticate
        authenticate_or_request_with_http_basic do |username, password|
          username == Wedding::Application.config.admin_username && password == Wedding::Application.config.admin_password
        end
      end
end
