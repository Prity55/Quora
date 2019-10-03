# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
   def update
    @user = current_user
    if @user.update_attributes(user_params)
      sign_in @user, force: true
      redirect_to welcomes_index_path(:user_id => @user) ,notice:"update data succesfully"
    else
      sign_in @user, force: true
      Rails.logger.info(@user.errors.messages.inspect)
      render :action => 'edit'
    end
     # debugger
     # @user=User.find(current_user.id)
     # if @user.update(update_resource)
      
     # else
     #  redirect_to questions_path ,notice:"some problem occure "
     # end
   end
   def edit
   end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private

  def user_params
    params.require(:user).permit( :name, :password, :password_confirmation)
  end
  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  #   params(:user).permit(:name);
  # end
end
