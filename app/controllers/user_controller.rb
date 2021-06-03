class UserController < ApplicationController
  before_action :set_user, only: %i[show]

  def show 
  end

  def new
    @user = User.new
  end
  
  private
  def set_user
    @user = current_user
  end
end