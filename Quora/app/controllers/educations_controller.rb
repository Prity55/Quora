class EducationsController < ApplicationController
	before_action :authenticate_user!
	def new
		@education = Education.new
	end
	def create
		@education = Education.new(education_params)
		respond_to do |format|
			if @education.save
				format.html do
				  redirect_to '/welcomes/index' ,notice: 'add successfully'
				end
			else
				format.html{render 'new'}
			end	
		end	
	end
	def show
		@education = Education.find(params[:id])
	end
	def edit
		@education = Education.find(params[:id]) 
	end
	def update
		@education = Education.find(params[:id])
		if !education_params.blank?
			respond_to do |format|
				if @education.update(education_params)
					format.html do
					  redirect_to '/welcomes/index' , notice:'information updated successfully'
					end
				else
				 format.html{render 'edit'}
			  end
			end
		else
			 redirect_to edit_education_path(@education), notice: "school value can't be blank"
		end	  
	end
	def destroy
		@education = Education.find(params[:id])
		if @education.destroy
			redirect_to welcomes_index_path, notice: 'delete record successfully'
		else 
			redirect_to welcomes_index_path, notice: 'some problem occure' 
		end
	end
	
	private 
	 def education_params
		params.require(:education).permit(:school, :concentration, :second_concentration, :degree, :graduation_year,:user_id)
	 end
end


