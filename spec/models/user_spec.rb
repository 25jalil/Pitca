require "rails_helper"

RSpec.describe User, :type => :model do
  it "checking lines to db" do
    user = FactoryGirl.create(:user, :admin)
    expect(User.last.email).to eq("example@email.com")
    expect(user.valid_password?('password')).to be(true)
    expect(User.last.role).to eq("admin")
  end

  it "should have valid factory" do
    FactoryGirl.build(:user).should be_valid
  end

  it "should require a username" do
    FactoryGirl.build(:user, :email => "")(expect(something).to be_valid
  end
end

