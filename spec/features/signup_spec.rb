require 'spec_helper'
require 'feature_helper'

feature "SignUp" do
  scenario "Sign up" do
    visit root_path
    within("#navbar-main") do
    	click_link 'Sign Up'
  	end
  	within("#user_form") do
	    fill_in 'Name', with: 'Jackie Koe'
	    fill_in 'Location', with: 'Minneapolis'
	    fill_in 'Email', with: 'jackie@email.com'
	    fill_in 'Password', with: 'password'
	    fill_in 'Password confirmation', with: 'password'
	    click_link 'Sign Up'
  	end
    expect(page).to have_content 'Logged in as jackie@email.com'
  end

end