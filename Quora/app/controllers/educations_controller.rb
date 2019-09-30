class EducationsController < ApplicationController

	def new
		@education = Education.new
	end
	def create
		
		@education = Education.new(education_params)

		if @education.save
			redirect_to education_url({:id => @education.id}) ,notice: 'add successfully'
	
		else
			render 'new'
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
			if @education.update(education_params)
				 redirect_to @education, notice:'information updated successfully'
			else
			 render 'edit'
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


