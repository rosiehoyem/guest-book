require 'spec_helper'
require 'feature_helper'

feature "Leave Message" do
	before :each do
    User.create(name: 'Sandy Metz', location: 'Kansas', email: 'sandy@example.com', :password => 'password', password_confirmation: 'password')
  end

  scenario "Log in" do
    visit root_path
    within("#navbar-main") do
    	click_link 'Log In'
  	end
  	within("#login_form") do
	    fill_in 'Email', with: 'sandy@email.com'
	    fill_in 'Password', with: 'password'
	    click_button 'Log In'
  	end
    expect(page).to have_content 'Logged in as sandy@email.com'
  end

  scenario "submit message form", :js => true do
    visit root_path
    fill_in 'Content', with: 'This is great!'
    click_link 'Submit'
    expect(current_path).to eq root_path
    expect(page).to have_content 'Thanks'
  end

end
