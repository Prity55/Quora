class TopicsController < ApplicationController
before_action :authenticate_user!
layout "all" 
	def index
		@topics = Topic.all
	end
	def new
		@topic = Topic.new
	end
	def create
		@topic = Topic.new(topic_params)
    if @topic.save
			redirect_to topics_path, notice: 'topic was successfully created.'
		else
		  render 'new'
		end
	end
	def update
		@topic = Topic.find(params[:id])
		if @topic.update(topic_params)
	    redirect_to topics_path, notice:"topic edit successfully"
    else
    	render 'edit'
    end
	end
	def show
		@topic = Topic.find(params[:id])
	end
	def edit
		@topic = Topic.find(params[:id])
	end
	def destroy
		@topic = Topic.find(params[:id])
		if @topic.destroy
			redirect_to topics_path, notice:"topic deleted successfully"
		else
			redirect_to topics_path, notice:"some issue occur"
		end
	end
	def all
		@user=User.find(current_user.id)
		@topics=@user.topics.distinct
	end
	def join
		@topic = Topic.find(params[:id])
		@add=@topic.users << current_user
		@topics=Topic.all
		redirect_to topics_path
	end
	def unjoin
		@topic = Topic.find(params[:id])
		if @topic.users.where(:id => current_user).present?
			if @topic.users.delete(current_user)
				redirect_to topics_path,notice:"unjoin topic"
			else
				redirect_to topics_path,notice:"some problem occur"
			end
		end
	end
	private
      def topic_params
		  params.require(:topic).permit(:topic_name)
	  end 
end