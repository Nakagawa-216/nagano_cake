class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    customer = Customer.find(current_customer.id)
    if customer.update(customer_params)
      redirect_to mypage_path
    else
      flash.now[:alert] = "必要事項を入力してください"
      @customer = Customer.find(current_customer.id)
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    customer = Customer.find(current_customer.id)
    customer.update(is_deleted: "true")
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
