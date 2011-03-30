class User < ActiveRecord::Base
  has_many :incidents
  attr_accessible :name, :email, :phone, :user_type
  
  PROFILE = {"Administrador"=>"1", "Técnico"=>"2", "Usuário"=>"3"}
  
  validates_presence_of :name
  validates_presence_of :phone
  validates_presence_of :user_type
  
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates_format_of :phone, :with => /\((\d{2})\)(\d{4})-(\d{4})$/i
  
end
