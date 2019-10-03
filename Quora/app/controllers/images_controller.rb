class ImagesController < ApplicationController
  before_action :authenticate_user!
  def new
    @image=Image.new
  end
  def create
   @image.avatar.attach(params[:avatar].merge(user_id: current_user.id))
  end
  def show
  end
end
