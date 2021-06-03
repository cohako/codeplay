class ProfilesController < ApplicationController
  
  before_action :set_profile, only: %i[edit update]
  before_action :set_user, 
                only: %i[show new create edit update destroy]
  before_action :authenticate_user!, only: %i[show new edit create update destroy]

  def index
  end
  
  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    if @user.create_profile!(profile_params)
      flash[:notice]= t('.success')
      redirect_to @user
    else
      render :new, notice: 'Erro'
    end
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
    params.require(:profile).permit(:name, :adress)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

end