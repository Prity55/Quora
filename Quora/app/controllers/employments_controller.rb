class EmploymentsController < ApplicationController
	before_action :authenticate_user!
	def new
		@employment=Employment.new
	end
	def create
		@employment = Employment.new(employment_params)
		if @employment.save
			redirect_to employment_path({:id => @employment.id}),notice: 'add successfully'
		else
			
			render 'new'
		end
	end
	def show
		@employment = Employment.find(params[:id])
	end
	def edit
		@employment = Employment.find(params[:id])
	end
	def update
		@employment = Employment.find(params[:id])
		if !employment_params.blank?
			if @employment.update(employment_params)
				redirect_to @employment, notice:'information updated successfully'
			else
				render 'edit'
			end
		else
			redirect_to new_employment_path(@employment), notice: "position and company can't be blank"	
		end
	end

	def index
		render 'new'
	end
	def destroy
		
		@employment = Employment.find(params[:id])

		if @employment.destroy
			redirect_to welcomes_index_path, notice: 'delete record successfully'
		else 
			redirect_to edit_employment_path, notice: 'something went wrong plz edit detail'
		end	
	end

	private 
	 def employment_params
	 	params.require(:employment).permit( :position, :company, :start_year, :end_year, :current_stagec, :user_id)
	 end

end
