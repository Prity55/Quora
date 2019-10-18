class UsersController < ApplicationController
  before_action :authenticate_user!
  layout "all" ,except:[:destroy]
  def index
    @users= User.all
  end
  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "user deleted successfully"
  end
  def bookmarks
    @bookmarks=User.find(3).bookmark_questions.map{|q| Question.find(q.question_id)}
  end
end
