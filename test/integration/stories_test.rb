require "test_helper"

class StoriesTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "ログインユーザーはストーリーを作成できる" do
    sign_in users(:one)

    assert_difference("Story.count", 1) do
      post stories_path, params: {
        story: {
          title: "ニキビ改善",
          description: "毎日の記録",
          started_on: Date.today
        }
      }
    end

    assert_redirected_to stories_path
  end
end
