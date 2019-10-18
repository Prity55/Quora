class WelcomesController < ApplicationController
  before_action :authenticate_user!
  layout "all"
  def index
   
  end
end
