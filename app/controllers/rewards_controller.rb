class RewardsController < ApplicationController
  def show
    @reward = Reward.find(params[:id])
    respond_to do |format|
      format.any { render json: @reward }
    end
  end

  def index
    @rewards = Reward.where(project_id: params[:project_id])
    respond_to do |format|
      format.any { render json: @rewards }
    end
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.create(reward_params)
    respond_to do |format|
      format.any { render json: @reward }
    end
  end

  def update
    @reward = Reward.find(params[:id])
    @reward.update(reward_params)
    respond_to do |format|
      format.any { render json: @reward }
    end
  end

  def destroy
    @reward = Reward.find(params[:id])
    @reward.destroy
  end

  private

  def reward_params
    params.require(:reward).permit(:amount, :description)
  end
end
