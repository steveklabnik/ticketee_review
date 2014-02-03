class ApiController < ActionController::Base
  before_action :check_token

  private

    def check_token
      authenticate_or_request_with_http_token do |token, options|
        User.where(token: token)
      end
    end
end
