class CoursesController < MainController
  before_action :authenticate_user!

  def index
    @courses = @q.result.order(updated_at: :desc).page params[:page]
  end

  def show
    @course = Course.find(params[:id])
    @ratings = Rating.where(teacher_id: @course.teacher_ids)
  end
end
