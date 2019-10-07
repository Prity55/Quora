class DownvotesController < ApplicationController
	before_action :authenticate_user!
	def new
		@downvote= Downvote.new
	 end
	def create
		@answer=Answer.find(params[:downvote][:answer_id])
		respond_to do |format|
		if !@answer.downvotes.where(:user_id =>current_user.id).present?
			 @downvote=@answer.downvotes.new(params_downvote.merge(user_id: current_user.id))
			  	if @downvote.save
						format.html do
	        #  redirect_to '/welcomes/index'
	        	 redirect_to question_path(@answer.question), notice:'downvoted successfully'
	          end
					else
						format.html{render 'new'}
						#redirect_to answer_path(@answer), notice:'downvote remove'
					end
		else
			@downvote=Downvote.where(:user_id =>current_user.id)
			@downvote.first.destroy
				format.html do
				  redirect_to question_path(@answer.question), notice:'some problem occure'
				end
		end
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


