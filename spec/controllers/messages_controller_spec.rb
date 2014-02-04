require 'spec_helper'

describe MessagesController do

  describe "GET new" do
    it "assigns a new message as @message" do
      get :new, {}
      assigns(:message).should be_a_new(Message)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Message" do
        expect {
          post :create, {:message => FactoryGirl.build(:message)}
        }.to change(Message, :count).by(1)
      end

      it "assigns a newly created message as @message" do
      	user = FactoryGirl.build(:user)
      	message = user.messages.build(content: "Test Message")
      	user.save
        post :create
        assigns(:message).should be_a(Message)
        assigns(:message).should be_persisted
      end

      it "redirects to the index" do
      	user = FactoryGirl.build(:user)
      	message = user.messages.build(content: "Test Message")
      	message.save
        post :create, {:message => valid_attributes}, valid_session
        response.should redirect_to(root_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved message as @message" do
        Message.any_instance.stub(:save).and_return(false)
        post :create, {:message => { "content" => nil }}, valid_session
        assigns(:message).should be_a_new(Message)
      end

      it "re-renders the 'new' template" do

        Message.any_instance.stub(:save).and_return(false)
        user = FactoryGirl.build(:user)
      	message = user.messages.build("Test Message")
        post :create, {:message => { "content" => nil }}, valid_session
        response.should render_template("new")
      end
    end
  end

end