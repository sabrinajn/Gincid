class Item < ActiveRecord::Base
  has_many :incidents
  attr_accessible :name, :description, :serial, :item_type

  TYPE = {"Hardware"=>"1", "Serviço"=>"2"}
  
   validates_presence_of :name
   validates_presence_of :description
   validates_presence_of :item_type

   validates_presence_of :serial, :message => "can't be blank", :if => proc { |item| item.item_type.to_s == TYPE["Hardware"] }
   
end
