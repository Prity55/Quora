class DownvotesController < ApplicationController
	before_action :authenticate_user!
	def new
		@downvote= Downvote.new
	 end
	def create
		@answer=Answer.find(params[:downvote][:answer_id])
		if !@answer.downvotes.where(:user_id =>current_user.id).present?
			 @downvote=@answer.downvotes.new(params_downvote.merge(user_id: current_user.id))
			
			if @downvote.save

				redirect_to answer_path(@answer), notice:'downvoted successfully'
			else
				redirect_to answer_path(@answer), notice:'downvote remove'
			end
		else
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


