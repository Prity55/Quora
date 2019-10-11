class UpvotesController < ApplicationController
	before_action :authenticate_user!
	 def new

		@upvote= Upvote.new
	 end
	def create
		
		@answer=Answer.find(params[:upvote][:answer_id])
		respond_to do |format|
			if !@answer.upvotes.where(:user_id =>current_user.id).present? 
				@upvote=@answer.upvotes.new(params_upvote.merge(user_id: current_user.id))
				if @answer.downvotes.where(:user_id =>current_user.id).present?
					@downvote=Downvote.where(:user_id =>current_user.id)
			  	@downvote.first.destroy
			   	format.html do
			     	redirect_to question_path(@answer.question), notice:'remove downvote successfully'
			 		end
				end
				if @upvote.save
					format.html do
					  redirect_to question_path(@answer.question), notice:'upvoted successfully'
					end
				else
					 format.html{render 'new'}
			end
			else
				#debugger
				@upvote=Upvote.where(:user_id =>current_user.id)
			  @upvote.first.destroy
			   	format.html do
			     	redirect_to question_path(@answer.question), notice:'remove upvote successfully'
			 		end
			end
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
