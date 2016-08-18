class CreateRewards < ActiveRecord::Migration[5.0]
  def change
    create_table :rewards do |t|
      t.integer :amount
      t.text :description
      t.string :title
      t.integer :project_id

      t.timestamps
    end
  end
end
