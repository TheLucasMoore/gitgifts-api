require 'rails_helper'

RSpec.describe Project, type: :model do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  it "has a valid factory" do
    expect(FactoryGirl.create(:project, user_id: @user.id)).to be_valid
  end

  it "validates that goals are an integer" do
    project = FactoryGirl.build(:project, goal: "Awesome!")
    expect(project.save).to be false
  end

  it "validates the presence of a goal" do
    project = FactoryGirl.build(:project, goal: nil)
    expect(project.save).to be false
  end

  it "validates the presence of a title" do
    project = FactoryGirl.build(:project, title: nil)
    expect(project.save).to be false
  end

  it "validates the presence of a description" do
    project = FactoryGirl.build(:project, description: nil)
    expect(project.save).to be false
  end

  it "has many rewards" do
    project = FactoryGirl.create(:project)
    5.times do
      FactoryGirl.create(:reward, project_id: project.id)
    end
    expect(project.rewards.size).to eq(5)
  end

  it "belongs to a user" do
    project = FactoryGirl.create(:project, user_id: @user.id)
    expect(project.user).to eq(@user)
  end

  it "MUST belong to a user to be valid" do
    project = FactoryGirl.build(:project, user_id: nil)
    expect(project.save).to be false
  end
end
