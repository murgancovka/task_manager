class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.references :user
      t.string   :name
      t.date     :deadline
      t.integer  :category_id
      t.text     :text
      t.boolean  :is_done
      t.boolean  :is_frozen
      t.boolean  :is_important
      t.boolean  :is_cancel
      t.boolean  :is_enabled
      
      t.timestamps
    end
  end
 
  def self.down
    drop_table :tasks
  end
end
