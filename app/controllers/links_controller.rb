class LinksController < ApplicationController
  before_filter :verify_user

  def index
    @user = current_user
    @links = @user.links
  end
  
  def new
    @user = current_user
    @subs = @user.subs
    @link = Link.new
    render :new
  end
  
  def create
    @link = Link.new(params[:link])
    if @link.save
      render :show
    else
      render :new
    end
  end
  
  def show
    @user = current_user
    @link = Link.find(params[:id])
  end
  
  def edit
    @user = current_user
    @link = Link.find(params[:id])
    if @link.author_id == current_user.id
      render :edit
    else
      flash[:errors] ||= []
      flash[:errors] << "You do not have permission to edit this link"
      render :index
    end
      
  end
  
  def update
    @link = Link.find(params[:link][:id])
    if @link.update_attributes(params[:link])
      render :show
    else
      render :edit
    end
  end
end
