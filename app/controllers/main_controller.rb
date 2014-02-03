class MainController < ApplicationController
  def index
  	@messages = Message.all.order(:created_at)
  	@message = current_user.messages.build
  end

end
