require "securerandom"
require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :name, :password, :session_token, :username#, :links_attributes
  
  has_many :subs,
  :foreign_key => :moderator_id, 
  :dependent => :destroy,
  :inverse_of => :moderator
  
  has_many :links,
  :foreign_key => :author_id
  
  has_many :comments,
  :foreign_key => :author_id
  
  # accepts_nested_attributes_for :links, :reject_if => :all_blank
  
  validates :username, :uniqueness => true
  validates :name, :username, :presence => true
  
  def issue_new_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
  end
 
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
 
  def check_password?(password_attempt)
    BCrypt::Password.new(self.password_digest) == password_attempt
  end
  
end
