class TopicsController < ApplicationController
before_action :authenticate_user!
	def index
		@topics = Topic.all
	end
	def new
		@topic = Topic.new
	end
	def create
		@topic = Topic.new(topic_params)
    	if @topic.save
		  redirect_to @topic, notice: 'topic was successfully created.'
		 else
		 	render 'new'
		end
	end
	
	def update
		@topic = Topic.find(params[:id])
		if @topic.update(topic_params)
		    redirect_to @topic
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
		if @topic.questions.blank?
		  @topic.destroy
		else
			redirect_to topics_path, notice:"topic have multiple question so it can't be delete"
		end
	end
	def all
		@user=User.find(current_user.id)

		@topics=@user.topics.distinct

	end
	def join
		@topic = Topic.find(params[:id])
		
		@hi=@topic.users << current_user
		@topics=Topic.all
		redirect_to action: 'all'
	end
	private
      def topic_params
		  params.require(:topic).permit(:topic_name)
	  end 

end