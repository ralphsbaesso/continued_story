class HistoriesController < ApplicationController
  def index
    render json: current_user.histories
  end

  def create
  end

  def update
  end

  def destroy
  end
end
