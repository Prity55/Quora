class QuestionsController < ApplicationController
  before_action :authenticate_user!
  def new
    @question = Question.new
  end
  def create
    case params[:question][:author_name]

        when "public"
          
      @question = current_user.questions.new(question_params.merge(user_id: current_user.id,author_name: current_user.name,follow: 0))
      else
      @question = current_user.questions.new(question_params.merge(user_id: current_user.id,author_name: 'anonymous',follow: 0))  
    end
    
    if @question.save
      debugger
      redirect_to question_url(@question)
    else
      render 'new'
    end

  end
  def edit
    @question = Question.find(params[:id]) 
  end
  def update
    @question = Question.find(params[:id]) 
     if @question.update(question_update)
      redirect_to question_url(@question)
     else
      render 'edit'
     end

  end
  def index
    @questions = Question.all
  end
  def follow
    @question = Question.find(params[:id])
    if @question.user.id!=current_user.id
      debugger
        follow1 = @question.follow+1 
        if @question.update(follow: follow1)
        redirect_to questions_path, notice:'followed'
        else 
          render 'follow'
        end 
    else
      follow1 = @question.follow-1
        if @question.update(follow: follow1)
        redirect_to questions_path, notice:'followed'
        else 
          render 'follow'
        end 
    end
  end
  def show 
      
         #@topics=Topic.joins(:questions).where("questions.topic_id IN (?)", Topic.all.pluck(:id))
    @answer=Answer.new
    #@upvote=Upvote.new
    @question=Question.find(params[:id])
    @answers= @question.answers 
    
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

      params.require(:question).permit(:question_link,:data,:topic_id)
  end
  def question_update
    params.require(:question).permit(:data,:question_link)
  end

end
