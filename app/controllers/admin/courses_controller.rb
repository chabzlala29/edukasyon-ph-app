module Admin
  class CoursesController < ApplicationController
    def index
      @courses = Course.all.page params[:page]
    end

    def edit
    end

    def create
    end

    def update
    end

    def destroy
    end
  end
end
