require 'rails_helper'

feature 'Create store', :devise do
  
  
  scenario 'Create valid store' do
  user = FactoryGirl.create(:user, :admin)
  login_as(user, scope: :user)
    store = FactoryGirl.create(:store, user: user)
    visit store_path(store)
    expect(page).to have_content store.company
  end
end