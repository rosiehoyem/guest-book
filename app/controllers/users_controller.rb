class UsersController < ApplicationController

	def new_message_form
  	@user = User.new
  end

	def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save   
      	flash[:notice] = "Thanks for stopping by!"     
        format.html { redirect_to root_path } 
        format.json { render action: 'main#root', status: :created, location: root_path }
      else
      	flash[:notice] = "I'm sorry. We couldn't save your message."
        format.html { render action: 'main#root' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :location, message_attributes: [:content])
  end
end
