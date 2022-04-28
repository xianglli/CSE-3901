class CoursesController < ApplicationController
  def sync
    @courses = Course.save_data_from_osu
  end

  def rec
    @courserec = Course.getrec(1,params[:n])
  end
end
