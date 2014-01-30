require 'spec_helper'
require 'feature_helper'

feature "Leave Name and Message" do
  scenario "submit form" do
    visit root_path
    fill_in 'name', with: 'John Doe'
    fill_in 'location', with: 'Minneapolis'
    fill_in 'content', with: 'This is great!'
    click_link 'Submit'
    expect(current_path).to eq root_path
    expect(page).to have_content 'Thanks'
  end

end