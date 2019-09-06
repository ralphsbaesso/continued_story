class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:update, :destroy]

  def show
    chapter = current_user.find_chapter(params[:id])
    render json: chapter
  end

  def create
    chapter = Chapter.new(params_chapter)
    chapter.save!
    render json: chapter
  end

  def update
    if @chapter.update(params_chapter)
      render json: @chapter
    else
      p @chapter.errors
    end
  end

  def destroy
    if @chapter.destroy
      render json: @chapter
    else
      p @chapter.errors
    end
  end

  private

  def params_chapter
    params.require(:chapter).permit(:title, :description, :content, :history_id)
  end

  def set_chapter
    @chapter = current_user.find_chapter(params[:id])
  end
end
