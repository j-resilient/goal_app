class CreateGoalComments < ActiveRecord::Migration[5.2]
  def change
    create_table :goal_comments do |t|
      t.integer :author_id, null: false
      t.integer :goal_id, null: false
      t.text :comment, null: false
      t.timestamps
    end
    add_index :goal_comments, :author_id
    add_index :goal_comments, :goal_id
  end
end
