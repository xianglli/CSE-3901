class CoursesController < ApplicationController
  def new
    # TODO: Add new course method (optional) or delete new action
    # I do not think we need new method since all the courses and information are from OSU website
  end

  def sync
    @courses = Course.save_data_from_osu
    render :show
    # TODO: Redirect the finished result to the show or somewhat pages.
  end

  def show
    @course = Course.find(params[:id])
  end

  def index
    @query = Course.ransack(params[:q])
    @courselist = @query.result
  end
end
