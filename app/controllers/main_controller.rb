class MainController < ApplicationController
  def index
  	@messages = Message.all
  	@user = User.new
  end

end
