class Incident < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :owner, :class_name => 'User'
  
  attr_accessible :description, :user, :owner_id, :item, :priority, :status
  
  validates_presence_of :description
  validates_presence_of :owner_id, :message => "can't be blank", :if => proc { |incident| incident.status == 2 }
  validates_presence_of :priority, :message => "can't be blank", :if => proc { |incident| incident.status == 2 }
  validates_presence_of :item_id   
  validates_numericality_of :item_id, :only_integer => true, :message => "is not a number"
  validates_numericality_of :user_id, :only_integer => true, :message => "is not a number"
  validates_numericality_of :owner_id, :only_integer => true, :message => "is not a number"
end
