require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe "Project API" do
    it 'Index is a list of all projects' do
      FactoryGirl.create_list(:project, 10)
      get 'index'
      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(json.length).to eq(10)
    end

    it 'Shows one project' do
      project = FactoryGirl.create(:project)
      get 'show', id: project.id
      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(json["title"]).to eq(project.title)
    end

    # it 'only allows a usee to delete their own project'
    #   user1 = FactoryGirl.create(:user)
    #   user2 = FactoryGirl.create(:user)
    #   project = FactoryGirl.create(:project, user: user1)
    #   delete '/projects/#{project.id}', method: :delete
    # end

  end
end
