class UpvotesController < ApplicationController
	
	 def new

		@upvote= Upvote.new
	 end
	def create
		
		@answer=Answer.find(params[:upvote][:answer_id])
		# @hi= params [:upvote][:answer_id]

		   

		# 	@question = Question.new(question_params.merge(user_id: current_user.id,author_name: current_user.name,follow: 0))
		# 	else
		#  	@question = Question.new(question_params.merge(user_id: current_user.id,author_name: 'anonymous',follow: 0))	
		# end
		#a.upvotes.where(:user_id =>4).present
		if !@answer.upvotes.where(:user_id =>current_user.id).present?
			 @upvote=@answer.upvotes.new(params_upvote.merge(user_id: current_user.id))
			#debugger
			if @upvote.save
				redirect_to answer_path(@answer), notice:'upvoted successfully'
			else
				redirect_to answer_path(@answer), notice:'some problem occure'
			end
		else
			#debugger
			@upvote=Upvote.where(:user_id =>current_user.id)
		    @upvote.first.destroy
		 redirect_to answer_path(@answer), notice:'some problem occure'
		end
	end
	def destroy
		@upvote=Upvote.find(params[:id])
		@upvote.destroy
	end
	def index
		@upvotes=Upvote.all
	end
	private
	def params_upvote

		params.require(:upvote).permit(:id,:answer_id)
	end
end
