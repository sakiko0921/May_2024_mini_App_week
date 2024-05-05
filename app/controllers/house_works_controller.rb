class HouseWorksController < ApplicationController
  before_action :set_house_work, only: [:destroy]

  def index
    @house_work = HouseWork.new
    @house_works = HouseWork.where(user_id: current_user.id).includes(:user).order(created_at: :desc)
  end

  def create
    puts params
    @house_work = current_user.house_works.build(house_work_params)
    if @house_work.save
      redirect_to house_works_path, success: "タスクを登録しました"
    else
      flash.now[:warning] = "タスクの登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @house_work.destroy!
    redirect_to house_works_path, success: "タスクを削除しました"
  end

  private

  def house_work_params
    params.require(:house_work).permit(:work_name, :time)
  end

  def set_house_work
    @house_work = current_user.house_works.find_by(id: params[:id])
  end
end
