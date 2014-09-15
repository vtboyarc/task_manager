class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :priority
      t.string :due_date

      t.timestamps
    end
  end
end
