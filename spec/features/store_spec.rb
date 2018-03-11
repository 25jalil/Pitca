require 'rails_helper'

feature 'Create store' do
  
  let(:user) { FactoryGirl.create(:user, :admin) }
  let(:store) { FactoryGirl.build(:store, user: user) }
  
  before(:each) do  
    login_as(user, scope: :user) 
    visit new_store_path
  end
  
  scenario 'is valid attributes' do
    fill_in 'store_company', with: store.company
    fill_in 'store_address', with: store.address
    fill_in 'store_cost_of_shipping', with: store.cost_of_shipping
    click_button 'Create Store'
    expect(page).to have_content 'Successfully!'
  end

  scenario 'is not valid without a company' do
    fill_in 'store_company', with: ''
    fill_in 'store_address', with: store.address
    fill_in 'store_cost_of_shipping', with: store.cost_of_shipping
    click_button 'Create Store'
    expect(page).to have_content 'Please enter a valid data!'
  end

  scenario 'is not valid without a address' do
    fill_in 'store_company', with: store.company
    fill_in 'store_address', with: ''
    fill_in 'store_cost_of_shipping', with: store.cost_of_shipping
    click_button 'Create Store'
    expect(page).to have_content 'Please enter a valid data!'
  end

  scenario 'is not valid without a cost_of_shipping' do
    fill_in 'store_company', with: store.company
    fill_in 'store_address', with: store.address
    fill_in 'store_cost_of_shipping', with: 'must be float'
    click_button 'Create Store'
    expect(page).to have_content 'Please enter a valid data!'
  end
end










