module Courses
  class TeachersController < MainController
    def show
      @course = Course.find(params[:course_id])
      @teacher = @course.teachers.find(params[:id])
      @ratings = @teacher.ratings

      render layout: false
    end
  end
end
