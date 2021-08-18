# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_user, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def reject_user
    @customer = Customer.find_by(email: params[:customer][:email].downcase)
    if @customer
      if @customer.active_for_authentication? == false
        flash[:error] = "退会済みです。"
        render "public/sessions/new"
      end
    else
      flash[:error] = "必須項目を入力してください。"
    end
  end
end
