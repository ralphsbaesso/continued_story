class HistoriesController < ApplicationController
  before_action :set_history, only: [:update, :destroy]

  def index
    transpoter = facade.select :history
      # if current_user
      #    current_user.histories
      # else
      #   History.where(private: false)
      # end

    p transpoter
    if transpoter.status == :green
      render json: transpoter.bucket[:histories]
    else
      render json: transpoter.messages, status: 499
    end
  end

  def show
    history =
      if current_user
        current_user.histories.find_by(id: params[:id])
      else
        History.find_by(id: params[:id])
      end

    render json: history
  end

  def create
    h = History.new params_history
    h.user = current_user
    h.save
    render json: h
  end

  def update
    if @history.update(params_history)
      render json: @history
    else
      p @history.errors
    end
  end

  def destroy
    if @history.delete
      render json: :ok
    else
      p @history.errors
    end
  end

  private

  def params_history
    params.require(:history).permit(:title, :description, :private)
  end

  def set_history
    @history = current_user.histories.find(params[:id])
  end

  def facade
    Facade.new current_user
  end
end
