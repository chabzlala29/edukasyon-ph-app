module Admin
  class TeachersController < AdminController
    before_action :set_teacher, only: [:edit, :update, :destroy]

    def index
      @q = Teacher.ransack(params[:q])
      @teachers = @q.result.order(updated_at: :desc).page params[:page]
    end

    def edit
      render layout: false
    end

    def new
      @teacher = Teacher.new
      render layout: false
    end

    def create
      @teacher = Teacher.new(teacher_params)
      @saved = @teacher.save
    end

    def update
      @teacher.assign_attributes(teacher_params)
      @saved = @teacher.save
    end

    def destroy
      @teacher.destroy

      redirect_to [:admin, :teachers]
    end

    private

    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    def teacher_params
      params.require(:teacher).permit!
    end
  end
end
