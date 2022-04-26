class CoursesController < ApplicationController
  def sync
    @courses = Course.save_data_from_osu
  end

  def rec
    @courserec = Course.getrec(rand(1..10000),params[:n])
  end
end
