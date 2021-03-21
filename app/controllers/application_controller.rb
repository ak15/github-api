class ApplicationController < ActionController::API

  private

  def current_user
    @_current_user ||= User.last
  end
end
