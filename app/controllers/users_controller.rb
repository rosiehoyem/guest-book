class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

	def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = current_user

  end

  private
  def user_params
    params.require(:user).permit(:name, :location, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
