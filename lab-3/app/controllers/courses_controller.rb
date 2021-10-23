class CoursesController < ApplicationController
  def new
    # TODO: Add new course method (optional) or delete new action
    # I do not think we need new method since all the courses and information are from OSU website
  end

  def sync
    @courses = Course.save_data_from_osu
    # TODO: Redirect the finished result to the show or somewhat pages.
  end

  def show
    @courses = Course.where(nil)

    # filters, used to search by condition
    @courses = @courses.filter_by_number(params[:number]) if params[:number].present?
  end

  def index
    @courses = Course.all
  end
end
