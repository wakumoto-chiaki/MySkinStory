class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_story

  def new
    @record = @story.records.new
  end

  def create
    @record = @story.records.build(record_params)

    if @record.save
      redirect_to story_path(@story), notice: "経過記録を投稿しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @record = @story.records.find(params[:id])
  end

  def update
    @record = @story.records.find(params[:id])

    if @record.update(record_params)
      redirect_to story_path(@story), notice: "経過記録を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_story
    @story = current_user.stories.find(params[:story_id])
  end

  def record_params
    params.require(:record).permit(:memo, :recorded_on, :image)
  end
end
