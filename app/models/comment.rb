class Comment < ActiveRecord::Base
  attr_accessible :body, :title, :author_id
  
  belongs_to :author,
  :class_name => "User",
  :foreign_key => :user_id
  
  has_many :link_comments,
  :foreign_key => :comment_id
  
  has_many :child_comment_comments,
  :class_name => "CommentComment",
  :foreign_key => :parent_id
  
  has_many :parent_comment_comments,
  :class_name => "CommentComment",
  :foreign_key => :child_id
  
  has_one :parent_comment,
   :through => :parent_comment_comments,
   :source => :parent
 
  has_many :child_comments,
  :through => :child_comment_comments,
  :source => :child  
end
