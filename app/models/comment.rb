class Comment < ActiveRecord::Base
  attr_accessible :body, :title
  
  has_many :link_comments,
  :foreign_key => :comment_id
  
  has_one :parent_comment,
  # :through => :link_comments,
  # :source => :parent_comment
  
  
end
