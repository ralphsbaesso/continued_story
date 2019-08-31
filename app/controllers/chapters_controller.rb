class ChaptersController < ApplicationController

  def show
    chapter = current_user.chapter(params[:id])
    render json: chapter
  end

  def create
    chapter = Chapter.new(params_chapter)
    chapter.save!
    render json: chapter
  end

  def update
    chapter = current_user.chapter(params[:id])
    chapter.update!(params_chapter)
    render json: chapter
  end

  def destroy
  end

  private

  def params_chapter
    params.require(:chapter).permit(:title, :description, :content, :history_id)
  end
end
