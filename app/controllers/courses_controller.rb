class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @ratings = Rating.where(teacher_id: @course.teacher_ids)
  end
end
