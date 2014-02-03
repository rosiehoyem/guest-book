class MessagesController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :update]

	def new
  	@message = current_user.messages.build
  end

	def create
    @message = current_user.messages.build(message_params)
    respond_to do |format|
      if @message.save   
      	flash[:notice] = "Thanks for stopping by!"     
        format.html { redirect_to root_path } 
        format.js
        format.json { render action: 'main#root', status: :created, location: root_path }
      else
      	flash[:notice] = "I'm sorry. We couldn't save your message."
        format.html { render action: 'main#root' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, user_attributes: [:name, :location, :email, :password, :password_confirmation,])
  end

end