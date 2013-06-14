class CommentComment < ActiveRecord::Base
  attr_accessible :child_id, :parent_id
  
  belongs_to :child,
  :class_name => "Comment",
  :foreign_key => :child_id
  
  belongs_to :parent,
  :class_name => "Comment",
  :foreign_key => :parent_id
end
