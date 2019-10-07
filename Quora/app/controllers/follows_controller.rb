class FollowsController < ApplicationController
  before_action :authenticate_user!
	def new
		@follow= Follow.new
	end
	def create
    
		@question=Question.find (params[:follow][:question_id])
		
  		if !@question.follows.where(:user_id =>current_user.id).present?
        		  @follow= @question.follows.create(params_follow.merge(user_id: current_user.id))
  			respond_to do |format|
          if @follow.save
             format.html do
        			 redirect_to questions_path(@question), notice: 'follow question successfully '
             end
        		else
              format.html do
        			  redirect_to questions_path(@question), notice:'unfollow question'
              end
        		end
        end
  		else
  			#debugger
  			@follow=Follow.where(:user_id =>current_user.id)
  		    @follow.first.destroy
          respond_to do |format|
            format.html do
    		 	    redirect_to questions_path(@question), notice:'some problem occur'
            end
  		    end
      end
	end
	private
	def params_follow
         params.require(:follow).permit(:id,:question_id)
	end   
end

	