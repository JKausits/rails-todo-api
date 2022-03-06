class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false, limit: 255
      t.text :description, null: false
      t.datetime :completed_at, null: true
      t.timestamps
    end
  end
end
