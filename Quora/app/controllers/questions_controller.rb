class QuestionsController < ApplicationController
  before_action :authenticate_user!, except:[:index]
  layout "all" ,except:[:follow ,:bookmark]
  def index
    @questions = Question.all
  end
  def new
    @question = Question.new
  end
  def create
    author_name = params[:question][:author_name] == "public" ? current_user.name : "anonymous"
    @question = current_user.questions.new(question_params.merge(author_name: author_name))  
    if @question.save
       redirect_to questions_url
    else
      render 'new'
    end
  end
  def edit
    @question = Question.find(params[:id]) 
  end
  def update
    @question = Question.find(params[:id]) 
    if @question.update(question_params)
      redirect_to question_url(@question)
    else
      render 'edit'
    end
  end
  def show 
    @answer=Answer.new
    @question=Question.find(params[:id])
    @answers= @question.answers 
  end
  def follow
    @question=Question.find(params[:id])
    if !@question.follows.where(:user_id =>current_user.id).present?
      @follow= @question.follows.create(question_id: @question, user_id: current_user.id)
      if @follow.save
          redirect_to questions_path(@question), notice: 'follow question successfully '
      else
        redirect_to questions_path(@question), notice:'some problem occur'
      end
    else
      @follow=Follow.where(:user_id =>current_user.id)
      @follow.first.destroy
      redirect_to questions_path(@question), notice:'unfollow question'
    end
  end
  def bookmark
    @question=Question.find(params[:id])
    if !@question.bookmark_questions.where(:user_id =>current_user.id).present?
      @bookmark= @question.bookmark_questions.create(question_id: @question, user_id: current_user.id)
      if @bookmark.save
          redirect_to questions_path(@question), notice: 'bookmark question successfully '
      else
        redirect_to questions_path(@question), notice:'some problem occur'
      end
    else
      @bookmark=BookmarkQuestion.where(:user_id =>current_user.id)
      @bookmark.first.destroy
      redirect_to questions_path(@question), notice:'remove bookmark'
    end
  end 
  def destroy
    @question = Question.find(params[:id])
    if @question.answers.blank?
      @question.destroy
      redirect_to questions_url, notice:"question deleted successfully"
    else
      redirect_to question_url(@question), notice:"question have multiple answer so it can't be delete"
    end
  end
  def view
    @questions=Question.all.where(:user_id => current_user.id)  
  end 
  private
    def question_params
      params.require(:question).permit( :question_link, :data, :topic_id)
    end
end
