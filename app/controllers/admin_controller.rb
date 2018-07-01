class AdminController < ApplicationController
  before_action :check_if_admin

  private

  def check_if_admin
    authenticate_user!
    redirect_to new_user_session_path unless current_user.admin?
  end
end
