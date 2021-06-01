class ProfileController < ApplicationController
  before_action :set_profile, only: %i[show  edit update]
  before_action :set_user, only: %i[new show create edit update]
  def show
  end

  def new

  end

  def create

  end
  
  def edit
  end
  
  def update
    if @profile.update(profile_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private
  
  def profile_params
    params.require(:lesson).permit(:name, :adress)
  end

  def set_user
    @user = current_user
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end