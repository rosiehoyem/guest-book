class MainController < ApplicationController
  def index
  	@messages = Message.all.order(:created_at)
  	if current_user
  		@message = current_user.messages.build
  	end
  end

end
