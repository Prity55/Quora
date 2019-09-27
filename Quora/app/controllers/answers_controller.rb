class AnswersController < ApplicationController
	
   #  def new
	 	# @answer = Answer.new
   #  end
	def create
		 debugger
		@question=Question.find(params[:question_id])
		@answer = @question.answers.create(params_answer.merge(downvote_count: 0,author: current_user.name))
		
		if @answer.save
			
			add_user(@answer)
			redirect_to answer_path(@answer), notice:'answer added successfully'
		else
			redirect_to question_path(@question), notice:@answer.errors
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
				redirect_to @answer ,notice:'anwser edit successfully'
			else
				
				render 'edit'
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
	# def downvote
		# @answer = Answer.find(params[:id])
	# 	@hi=@answer.users

	# 	if @answer.users==current_user.id
			
	# 		downvote1 =@answer.downvote_count-1
	# 	else
	# 		downvote1 = @answer.downvote_count+1 
	# 	end
	# 	if @answer.update(downvote_count: downvote1)
	# 		redirect_to answers_path, notice:'downvote'
	# 	else 
	# 	    redirect_to answers_path, notice:'something went wrong'
	# 	end 
		 
	# end
	private
	def params_answer

		params.require(:answer).permit(:data)
	end
	def add_user(answer)
		@answer = Answer.find(answer.id)
		
		@hi=@answer.users << current_user
		
		
	end
end
