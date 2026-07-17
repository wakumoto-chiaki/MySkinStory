class StoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @stories = current_user.stories
  end

  def new
    @story = Story.new
  end

  def show
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

  private

  def story_params
    params.require(:story).permit(:title, :description, :started_on)
  end
end
