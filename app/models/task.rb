class Task < ActiveRecord::Base
  has_event_calendar
  
  belongs_to :user
  belongs_to :event

  validates :name, :presence => { :message => "Name of the task can't be blank" }
  validates :text, :presence => { :message => "Text can't be blank" }
  
  validates :deadline, :presence => { :message => "Deadline can't be blank" }
  
  attr_accessible :name, :text, :is_enabled, :is_frozen, :is_cancel, :user_id, :deadline

  scope :important, :conditions => { :is_important => true }
  scope :done, :conditions => { :is_done => true }

  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['name LIKE ? OR text LIKE ?', search_condition, search_condition])
  end
  

  has_event_calendar :start_at_field  => 'created_at', :end_at_field => 'deadline'
end
