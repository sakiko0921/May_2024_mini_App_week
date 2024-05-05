class ResultsController < ApplicationController
  def index
    @total_time = HouseWork.total_time(current_user)
    @total_money = HouseWork.total_money(current_user)
  end
end
