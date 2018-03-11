require "rails_helper"

RSpec.describe Store, :type => :model do

  it { should have_many(:products).dependent(:destroy) }
  it { should have_many(:orders) }
  it { should have_many(:menus) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:company) }
  it { should validate_length_of(:company).is_at_most(40) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:cost_of_shipping) }


  it "checking lines to db" do
    store = FactoryGirl.create(:user_with_store)
    expect(Store.first.company).to eq('Flatsatck')
    expect(Store.first.address).to eq('kazan, pushkina 46')
    expect(Store.first.cost_of_shipping).to eq(35.0)
    expect(Store.first.latitude).to eq(55.793719)
    expect(Store.first.longitude).to eq(49.1253406)
  end

  it "should have valid factory" do
    FactoryGirl.build(:store).valid?
  end
end

