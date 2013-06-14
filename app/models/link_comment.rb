class LinkComment < ActiveRecord::Base
  attr_accessible :comment_id, :link_id
  
  belongs_to :comment
  
  belongs_to :link
end
