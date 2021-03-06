class AddGithubToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :github, :string
    add_column :users, :github_url, :string
    add_column :users, :avatar_url, :string
    add_column :users, :city, :string
    add_column :users, :bio, :text
  end
end
