class FollowsController < ApplicationController
  before_action :authenticate_user!
	def new
		@follow= Follow.new
	end
	def create

		@question=Question.find (params[:follow][:question_id])
		
		if !@question.follows.where(:user_id =>current_user.id).present?
      		  @follow= @question.follows.create(params_follow.merge(user_id: current_user.id))
		   	
		   	if @follow.save
      			redirect_to question_path(@question), notice: 'follow question successfully '
      		else
      			redirect_to question_path(@question), notice:'unfollow question'
      		end
		else
			#debugger
			@follow=Follow.where(:user_id =>current_user.id)
		    @follow.first.destroy
		 	redirect_to question_path(@question), notice:'some problem occure'

		end
	end
	private
	def params_follow
         params.require(:follow).permit(:id,:question_id)
	end   
end

	