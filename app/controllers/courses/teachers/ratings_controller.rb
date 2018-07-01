module Courses
  module Teachers
    class RatingsController < ApplicationController
      def create
        @teacher = Teacher.find(params[:teacher_id])
        @teacher.ratings.create(
          comment: params[:comment],
          rating: params[:rating],
          user_id: current_user.id
        )
        @ratings = @teacher.ratings
      end
    end
  end
end
