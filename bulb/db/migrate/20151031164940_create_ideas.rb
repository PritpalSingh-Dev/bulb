class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.text :blurb
      t.text :reason
      t.text :goal
      t.text :implementation
      t.float :budget

      t.timestamps null: false
    end
  end
end
