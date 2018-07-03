module Api
  class RatingsController < ApiController
    def destroy
      rating = current_user.ratings.find(params[:id])
      @teacher = rating.teacher
      @course = Course.find(params[:course_id])
      rating.destroy

      @ratings = @teacher.reload.ratings
    end
  end
end
