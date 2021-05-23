class LessonsController < ApplicationController
  before_action :set_course, only: %i[new create edit update]
  before_action :set_lesson, only: %i[edit update]

  def index
  end

  def show
    @lessons = Lesson.all
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
    @lesson = Lesson.update(lesson_params)
    if @lesson
      flash[:notice]= t('.success')
      redirect_to @course
    else
      render :new
    end
  end
  
  def destroy
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