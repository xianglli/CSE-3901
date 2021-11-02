class SectionController < ApplicationController
  def show
    @section = Section.find(params[:id])
  end

  def index
    @query = Section.ransack(params[:q])
    @section = @query.result
  end
end
