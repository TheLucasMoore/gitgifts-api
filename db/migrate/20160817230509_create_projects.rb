class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.integer :goal
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
