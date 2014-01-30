class MessagesController < ApplicationController

	def new
  	@message = Message.new
  end

	def create
    @message = Message.new(message_params)
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
    params.require(:message).permit(:name, :location, message_attributes: [:content])
  end

  def set_user
    @user = curent_user
  end
end