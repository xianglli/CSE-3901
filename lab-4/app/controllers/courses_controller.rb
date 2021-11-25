class CoursesController < ApplicationController
  def sync
    @courses = Course.save_data_from_osu
  end
end
