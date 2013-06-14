class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end
  
  def create
    #may be make creation of comments through link and comment itself
  end

end
