class LessonsController < ApplicationController
  before_action :set_course, only: %i[new create edit update destroy]
  before_action :set_lesson, only: %i[edit update destroy]
  before_action :authenticate_user!, only: %i[new edit create update destroy]

  def index
  end

  def show
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.create(lesson_params)
    @lesson.course_id = @course.id
    if @lesson.save
      flash[:notice]= t('.success')
      redirect_to @course
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @lesson.update(lesson_params)
      flash[:notice] = t('.success')
      redirect_to @course
    else
      render :edit
    end
  end
  
  def destroy
    if @lesson.destroy
      flash[:notice] = t('.success')
      redirect_to course_path(@course)
    else
      render :show, notice: t('.fail')
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:name, :content)
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

end