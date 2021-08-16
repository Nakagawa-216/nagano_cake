class Admins::HomesController < ApplicationController
  def top
    @orders = Order.all
  end
end
