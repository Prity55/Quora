class AnswersController < ApplicationController
	before_action :authenticate_user!
	after_action :add_user, only: :create
  def new
 	 @answer = Answer.new
  end
	def create
		@question=Question.find(params[:answer][:question_id])
		@answer = @question.answers.create(params_answer.merge(author: current_user.name))
		respond_to do |format|
			if @answer.save
				format.html do
				  redirect_to question_path(@question), notice:'answer added successfully'
				end
			else
				format.html do
					redirect_to question_path(@question), notice:@answer.errors
				end
			end
	  end
	end
	def show
		@upvote=Upvote.new
		@answer=Answer.find(params[:id])
		@downvote=Downvote.new
		@upvotes= @answer.upvotes.count	
	end
	def edit 
		@answer=Answer.find(params[:id])
	end
	def update
		@answer=Answer.find(params[:id])
		if @answer.update(params_answer)
			redirect_to question_path(@answer.question) ,notice:'anwser edit successfully'
		else
			render 'edit'
		end
	end
	def downvote
		@answer=Answer.find(params[:id])
		if @answer.votes.where(:user_id =>current_user.id, status: "upvote").present?
			@upvote=@answer.votes.where(:user_id =>current_user.id, status: "upvote")
		  @upvote.first.destroy
		end
		if !@answer.votes.where(:user_id =>current_user.id).present?
			@vote=@answer.votes.create(user_id: current_user.id, status: "downvote")
			if @vote.save
				redirect_to question_path(@answer.question), notice:'downvoted successfully'
			else
					redirect_to question_path(@answer.question), notice:'issue occur'
			end
	  elsif @answer.votes.where(:user_id =>current_user.id, status: "downvote").present?
			@vote=@answer.votes.where(:user_id =>current_user.id, status: "downvote")
			@vote.first.destroy
		  redirect_to question_path(@answer.question), notice:'remove downvote successfully'
	  end
	end
	def upvote
		@answer=Answer.find(params[:id])
		if @answer.votes.where(:user_id =>current_user.id, status: "downvote").present?
			@downvote=@answer.votes.where(:user_id =>current_user.id, status: "downvote")
  		@downvote.first.destroy
		end
		if !@answer.votes.where(:user_id =>current_user.id).present?
			@vote=@answer.votes.create(user_id: current_user.id, status: "upvote")
			if @vote.save
				redirect_to question_path(@answer.question), notice:'upvoted successfully'
			else
					redirect_to question_path(@answer.question), notice:'issue occur'
			end
	  elsif @answer.votes.where(:user_id =>current_user.id, status: "upvote").present?
			@vote=@answer.votes.where(:user_id =>current_user.id, status: "upvote")
			@vote.first.destroy
		  redirect_to question_path(@answer.question), notice:'remove upvote successfully'
	  end
	end
	def destroy
		@answer=Answer.find(params[:id])
		@question=@answer.question_id
		@answer.destroy
		redirect_to question_path(@question)
	end
	def index
		@answers=Answer.all
	end
	private
	def params_answer

		params.require(:answer).permit(:data)
	end
	def add_user
		@answer.users << current_user
	end
end
