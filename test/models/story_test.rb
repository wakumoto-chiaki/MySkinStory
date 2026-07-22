require "test_helper"

class StoryTest < ActiveSupport::TestCase
  test "タイトルと開始日があれば保存できる" do
    story = Story.new(
      title: "ニキビ改善",
      started_on: Date.today,
      user: users(:one)
    )

    assert story.valid?
  end

  test "タイトルがないと保存できない" do
    story = Story.new(
      title: nil,
      started_on: Date.today,
      user: users(:one)
    )

    assert_not story.valid?
  end

  test "開始日がないと保存できない" do
    story = Story.new(
      title: "ニキビ改善",
      started_on: nil,
      user: users(:one)
    )

    assert_not story.valid?
  end
end