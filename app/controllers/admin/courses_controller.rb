module Admin
  class CoursesController < ApplicationController
    before_action :set_course, only: [:edit, :update, :destroy]

    def index
      @courses = Course.all.page params[:page]
    end

    def edit
      render layout: false
    end

    def create
    end

    def update
      @course.assign_attributes(course_params)
      @saved = @course.save
    end

    def destroy
      @course.destroy

      redirect_to [:admin, :courses]
    end

    private

    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :summary, :description, :room)
    end
  end
end
