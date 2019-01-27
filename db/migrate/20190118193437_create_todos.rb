class CreateTodos < ActiveRecord::Migration[5.2]
  def up
    create_table :todos do |t|
      t.string "content"
      t.integer "position"
      t.boolean "complete", :default => false
      t.timestamps
    end
  end

  def down
    drop_table :todos
  end
end
