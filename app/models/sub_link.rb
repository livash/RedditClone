class SubLink < ActiveRecord::Base
  attr_accessible :link_id, :sub_id
  
  belongs_to :sub
  belongs_to :link
  
  # validates :sub, :link
end
