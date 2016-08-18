require 'rails_helper'

RSpec.describe Post, type: :model do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @project = FactoryGirl.create(:project, user_id: @user.id)
  end

  it "has a valid factory" do
    expect(FactoryGirl.create(:post, user_id: @user.id)).to be_valid
  end

  it "is invalid without a title" do
    @post = FactoryGirl.build(:post, user_id: @user.id, title: nil)
    expect(@post.save).to be false
  end

  it "is invalid without a description" do
    @post = FactoryGirl.build(:post, user_id: @user.id, description: nil)
    expect(@post.save).to be false
  end

  it "belongs to a project" do
    @post = FactoryGirl.create(:post, project_id: @project.id)
    expect(@post.project).to eq(@project)
  end

  it "MUST belong to a project to be valid" do
    post = FactoryGirl.build(:post, project_id: nil)
    expect(post.save).to be false
  end

  it "belongs to a user" do
    @post = FactoryGirl.create(:post, user_id: @user.id)
    expect(@post.user).to eq(@user)
  end

  it "MUST belong to a user to be valid" do
    post = FactoryGirl.build(:post, user_id: nil)
    expect(post.save).to be false
  end
end
