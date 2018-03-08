require "rails_helper"

RSpec.describe User, :type => :model do
  it "checking lines to db" do
    user = FactoryGirl.create(:user, :admin)
    expect(User.first.name).to eq("ilnar")
    expect(User.first.email).to eq("example@email.com")
    expect(user.valid_password?('password')).to be(true)
    expect(User.first.role).to eq("admin")
  end

  it "should have valid factory" do
    FactoryGirl.build(:user).valid?
  end
end

