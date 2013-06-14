class Sub < ActiveRecord::Base
  attr_accessible :moderator_id, :name, :links_attributes
  
  belongs_to :moderator,
  :class_name => "User",
  :foreign_key => :moderator_id
  
  has_many :sub_links,
   :inverse_of => :sub,
   :dependent => :destroy 
  
  has_many :links, :through => :sub_links, source: :link
  
  accepts_nested_attributes_for :links, :reject_if => lambda { |attr| attr[:url].blank? }
  
  # validates :moderator,
#   :class_name => "User"
  
  
end
