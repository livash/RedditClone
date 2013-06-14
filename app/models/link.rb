class Link < ActiveRecord::Base
  attr_accessible :url, :title, :sub_ids, :text, :author_id

  belongs_to :author,
  :class_name => "User",
  :foreign_key => :author_id
  
  has_many :sub_links, :inverse_of => :link
  
  has_many :subs, :through => :sub_links, :source => :sub
  
  has_one :moderator, :through => :subs, :source => :moderator
  
  has_many :link_comments,
  :foreign_key => :link

end
