class HistoriesController < ApplicationController
  def index
    render json: current_user.histories
  end

  def show
    history = current_user.histories.find_by(id: params[:id])
    render json: history
  end

  def create
    h = History.new params_history
    h.user = current_user
    h.save
    render json: :ok
  end

  def update
  end

  def destroy
  end

  private

  def params_history
    params.require(:history).permit(:title, :description, chapters_attributes: [:title, :description, :content])
  end
end
