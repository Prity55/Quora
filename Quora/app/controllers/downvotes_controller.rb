class DownvotesController < ApplicationController
	def new

		@downvote= Downvote.new
	 end
	def create
		
		@answer=Answer.find(params[:downvote][:answer_id])
		# @hi= params [:upvote][:answer_id]

		   

		# 	@question = Question.new(question_params.merge(user_id: current_user.id,author_name: current_user.name,follow: 0))
		# 	else
		#  	@question = Question.new(question_params.merge(user_id: current_user.id,author_name: 'anonymous',follow: 0))	
		# end
		#a.upvotes.where(:user_id =>4).present
		if !@answer.downvotes.where(:user_id =>current_user.id).present?
			 @downvote=@answer.downvotes.new(params_downvote.merge(user_id: current_user.id))
			
			if @downvote.save

				redirect_to answer_path(@answer), notice:'downvoted successfully'
			else
				redirect_to answer_path(@answer), notice:'downvote remove'
			end
		else
			#debugger
			@downvote=Downvote.where(:user_id =>current_user.id)
		    @downvote.first.destroy
		 redirect_to answer_path(@answer), notice:'some problem occure'
		end
	end
	def destroy
		@downvote=Downvote.find(params[:id])
		@downvote.destroy
	end
	
	private
	def params_downvote

		params.require(:downvote).permit(:id,:answer_id)
	end
end


