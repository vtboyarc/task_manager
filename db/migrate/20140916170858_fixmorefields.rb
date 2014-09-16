class Fixmorefields < ActiveRecord::Migration
  def up
    change_table :tasks do |t|
      t.change :user_id, :integer
    end
  end

  def down
  end
end
