class CoursesController < ApplicationController
  def new
  end

  def sync
    @courses = Course.save_data_from_osu
  end

  def show
    @course = Course.find(params[:id])
  end

  def index
    @query = Course.ransack(params[:q])
    @course = @query.result
  end
end
