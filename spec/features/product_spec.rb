require 'rails_helper'

feature 'Create product' do
  
  let(:user) { FactoryGirl.create(:user) }
  let(:store) { FactoryGirl.create(:store, user: user) }
  let(:product) { FactoryGirl.build(:product) }
  
  before(:each) do  
    login_as(user, scope: :user) 
    visit store_path(store)
  end
  
  #scenario 'is valid attributes' do
   # fill_in 'product_name', with: product.name
    #fill_in 'product_description', with: product.description
    #attach_file :product_product_image, product.product_image
    #fill_in 'product_price', with: product.price
    #fill_in 'product_category', with: product.category
    #click_button 'Create Product'
    #expect(page).to have_content 'Successfully!'
  #end
end










