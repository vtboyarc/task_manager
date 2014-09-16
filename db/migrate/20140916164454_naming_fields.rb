class NamingFields < ActiveRecord::Migration
  def up
    
    change_table :tasks do |t|
      t.change :project_id, :integer
      t.change :tag_id, :integer
      t.change :user_id, :integer
    end
      
    change_table :tags do |t|
      t.change :name, :string
    end
  
    change_table :projects do |t|
      t.change :name, :string
      t.change :desc, :text
    end
  end

  def down
  end
  
end
