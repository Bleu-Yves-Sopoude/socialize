class AppController < ApplicationController
  helper_method :current_user

  def current_user
    User.first
  end
end
