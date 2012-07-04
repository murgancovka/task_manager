class Task < ActiveRecord::Base
  belongs_to :user

  validates :name, :presence => { :message => "Name of the task can't be blank" }
  validates :text, :presence => { :message => "Text can't be blank" }
  
  attr_accessible :name, :text, :is_enabled, :is_frozen, :is_cancel, :user_id 
end
