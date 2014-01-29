require 'spec_helper'

describe Message do
  it "belongs to a user" do
    t = Message.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end

	it "is invalid without content" do
		message = FactoryGirl.build(:message, content: nil)
		expect(message).to have(1).errors_on(:content)
	end
end
