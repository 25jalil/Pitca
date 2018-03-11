require 'rails_helper'

feature 'User index page', :devise do
  scenario 'user sees own email address' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    visit admin_users_path
    expect(page).to have_content user.email
  end

  scenario 'redirect a user to the user role' do
    user = FactoryGirl.create(:user, :user) 
    login_as(user, scope: :user) 
    visit admin_users_path
    expect(page).to have_content "Log in as the administrator!"
  end
end
