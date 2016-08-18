require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it "validates presence of a github username" do
    user = FactoryGirl.build(:user, github: " ")
    expect(user).to_not be_valid
  end

  it "validates the user's github username" do
    user1 = FactoryGirl.create(:user, github: "AwesomeDude")
    user2 = FactoryGirl.build(:user, github: "AwesomeDude")
    expect(user1).to be_valid
    expect(user2.save).to be false
  end

  it "is invalid without a password" do
    user = FactoryGirl.build(:user, password: "")
    expect(user).to_not be_valid
  end

  it "is invalid without an email" do
    user = FactoryGirl.build(:user, email: "")
    expect(user).to_not be_valid
  end
end
