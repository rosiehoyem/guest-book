require 'spec_helper'

describe User do
  it "has many messages" do
    t = User.reflect_on_association(:messages)
    expect(t.macro).to eq(:has_many)
  end

  it "is invalid without a name" do
		user = FactoryGirl.build(:user, name: nil)
		expect(user).to have(1).errors_on(:name)
	end

  it "is invalid without a location" do
		user = FactoryGirl.build(:user, location: nil)
		expect(user).to have(1).errors_on(:location)
	end
end
