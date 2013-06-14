class SubsController < ApplicationController
  before_filter :verify_user
  
  def new
    @user = current_user
    @sub = Sub.new
  end
  
  def create
    @user = current_user
    @sub = @user.subs.new(params[:sub])
    if @sub.save
      render :show
    else
      render :new
    end
  end
  
  def show
    @user = current_user
    @sub = Sub.find(params[:id])
    render :show
  end
  
  def edit
    @user = current_user
    @sub = Sub.find(params[:id])
  end
  
  def update
    @user = current_user
    @sub = Sub.find(params[:sub][:id])
    @sub.update_attributes(params[:sub])
    render :show
  end

end
