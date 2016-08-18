require 'rails_helper'

RSpec.describe Reward, type: :model do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @project = FactoryGirl.create(:project)
  end

  it "has a valid factory" do
    expect(FactoryGirl.create(:reward, user_id: @user.id)).to be_valid
  end

  it "validates the presence of an amount" do
    reward = FactoryGirl.build(:reward, amount: nil)
    expect(reward.save).to be false
  end

  it "validates that the amount is a number" do
    reward = FactoryGirl.build(:reward, amount: "tests are rewarding")
    expect(reward.save).to be false
  end

  it "validates the presence of a description" do
    reward = FactoryGirl.build(:reward, description: nil)
    expect(reward.save).to be false
  end

  it "belongs to a user" do
    reward = FactoryGirl.create(:reward, user_id: @user.id)
    expect(reward.user).to eq(@user)
  end

  it "belongs to a project" do
    reward = FactoryGirl.create(:reward, project_id: @project.id)
    expect(reward.project).to eq(@project)
  end
end
