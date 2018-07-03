class MainController < ApplicationController
  before_action :set_q

  private

  def set_q
    @q = Course.ransack(params[:q])
  end
end
