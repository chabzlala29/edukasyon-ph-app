module Admin
  class CoursesController < AdminController
    before_action :set_course, only: [:edit, :update, :destroy]
    before_action :set_teachers, only: [:edit, :new]

    def index
      @q = Course.ransack(params[:q])
      @courses = @q.result.order(updated_at: :desc).page params[:page]
    end

    def edit
      render layout: false
    end

    def new
      @course = Course.new
      render layout: false
    end

    def create
      @course = Course.new(course_params)
      @saved = @course.save
      @course.teacher_ids = params[:course][:teachers_ids]
    end

    def update
      @course.assign_attributes(course_params)
      @saved = @course.save
      @course.teacher_ids = params[:course][:teachers_ids]
    end

    def destroy
      @course.destroy

      redirect_to [:admin, :courses]
    end

    private

    def set_course
      @course = Course.find(params[:id])
    end

    def set_teachers
      @teachers = Teacher.all.order(:firstname)
      @course_teachers = @course.teachers
    end

    def course_params
      params.require(:course).permit(:name, :summary, :description, :room)
    end
  end
end
