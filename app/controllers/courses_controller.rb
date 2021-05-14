class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end
  def create
    p course_params
    @course = Course.new(course_params)
    @course.save
  end

  private
  def course_params
    params.require(:course).permit(:name, :description, :code, :price, :enrollment_deadline)
  end
end