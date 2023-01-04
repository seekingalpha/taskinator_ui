module TaskinatorUi
  class ApplicationController < ActionController::Base
    before_action :authenticate, if: -> { TaskinatorUi.http_basic_auth }

    protected

    def authenticate
      authenticate_or_request_with_http_basic(nil, nil, &TaskinatorUi.http_basic_auth)
    end
  end
end
