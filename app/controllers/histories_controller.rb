class HistoriesController < ApplicationController
  def index
    render json: current_user.histories
  end

  def show
    history = current_user.histories.find_by(id: params[:id])
    render json: history
  end

  def create
  end

  def update
  end

  def destroy
  end
end
