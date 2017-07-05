require 'rails_helper'

feature 'sign_in', :devise do
  scenario 'user cannot sign in if not registered' do
    signin('person@example.com', 'password')
    expect(page).to have_content 'invalid email or password'
  end

  scenario 'user can sign in with valid credentials' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    expect(page).to have_content 'Signed in succesfully.'
  end

  scenario 'user cannot sign in with invalid email' do
    user = FactoryGirl.create(:user)
    signin('invalid@email.com', user.password)
    expect(page).to have_content 'invalid email or password'
  end

  scenario 'user sign in with invalid password' do
    user = FactoryGirl.create(:user)
    signin(user.email, 'invalidpass')
    expect(page).to have_content 'invalid email or password'
  end
end
