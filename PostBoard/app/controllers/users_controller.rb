class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    #binding.pry
    # @params=params.require(:user).permit(:name, :email, :phone, :password_digest)
    # user_params={
    #   name:@params[:name],
    #   email:@params[:email],
    #   phone:@params[:phone],
    #   password:@user.authenticate(@params[:password_digest])
    # }
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
      end
    else
      render :new
    end
  end

  def login
  end

  def login_create

    @user = User.find_by(name: params[:name])   
    #binding.pry
    if @user &&  @user.authenticate(params[:password])

      session[:user_id] = @user.id

      respond_to do |format|
        format.html { redirect_to users_path, notice: 'user successfully logined.' }
      end

    else
      render :login
    end
  end

  def logout_destroy
    session[:user_id] = nil
    render :login
  end

  def edit
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
      end
    else
      respond_to do |format|
        format.html { render :edit, notice: 'Please update again.' }
      end
      # render :edit
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone, :password)
    # params.require(:user).permit(:name, :email, :phone, :password_confirmation)
  end

end