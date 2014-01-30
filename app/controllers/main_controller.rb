class MainController < ApplicationController
  def index
  	@messages = Message.all.order(:created_at)
  	@user = User.new
  end

end
