class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy]
  before_action :set_instructors, only: %i[show new edit]

  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to @course
    else
      set_instructors
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Atualizado com sucesso'
    else
      set_instructors
      render :edit
    end
  end

  def destroy
    if @course.destroy
    redirect_to courses_path
    else
      flash[:notice] = t('.fail')
      render :show
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def set_instructors
    @instructors = Instructor.all
  end

  def course_params
    params.require(:course)
          .permit(:name, 
                  :description, 
                  :code, 
                  :price, 
                  :enrollment_deadline, 
                  :instructor_id)
  end
end