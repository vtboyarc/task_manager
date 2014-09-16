class NamingFields < ActiveRecord::Migration
  def up
    
    change_table :tasks do |t|
      t.change :project_id, :integer
      t.change :tag_id, :integer
      t.change :user_id, :integer
    end
      
    
  end

  def down
  end
  
end
