require "rails_helper"

RSpec.describe Store, :type => :model do
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

