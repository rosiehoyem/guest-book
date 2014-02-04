require 'spec_helper'
require 'feature_helper'

feature "Leave Message" do
	before :each do
    @user = FactoryGirl.build(:user)
  end

  scenario "Log In" do
    visit root_path
    within("#navbar-main") do
    	click_link 'Log In'
  	end
  	within("#login_form") do
	    fill_in 'Email', with: @user.email
	    fill_in 'Password', with: @user.password
	    click_link 'Log In'
      page.set_rack_session(user_id: @user.id)
  	end
    expect(page).to have_content 'Logged in as sandy@email.com'
  end

  scenario "submit message form", :js => true do
    page.set_rack_session(user_id: @user.id)
    visit root_path
    fill_in 'Content', with: 'This is great!'
    click_link 'Submit'
    expect(current_path).to eq root_path
    expect(page).to have_content 'This is great!'
  end

end
