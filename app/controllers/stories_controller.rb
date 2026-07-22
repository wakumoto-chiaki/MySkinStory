class StoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @stories = current_user.stories
  end

  def new
    @story = Story.new
  end

  def show
    @story = current_user.stories.includes(:records).find(params[:id])

    @before_record = @story.before_record
    @after_record = @story.after_record
  end

  def edit
    @story = current_user.stories.find(params[:id])
  end

  def create
    @story = current_user.stories.build(story_params)

    if @story.save
      redirect_to stories_path, notice: "ストーリーを作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @story = current_user.stories.find(params[:id])

    if @story.update(story_params)
      redirect_to story_path(@story), notice: "ストーリーを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @story = current_user.stories.find(params[:id])
    @story.destroy

    redirect_to stories_path, notice: "ストーリーを削除しました。"
  end

  private

  def story_params
    params.require(:story).permit(:title, :description, :started_on)
  end
end
