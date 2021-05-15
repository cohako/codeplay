class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.all
  end
end