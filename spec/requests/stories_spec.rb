require "rails_helper"

RSpec.describe "Stories", type: :request do
  let(:user) { create(:user) }

  describe "GET /stories" do
    context "ログインしている場合" do
      before do
        sign_in user
      end

      it "Story一覧を表示できる" do
        get stories_path

        expect(response).to have_http_status(:success)
      end
    end

    context "ログインしていない場合" do
      it "ログインページへリダイレクトされる" do
        get stories_path

        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "POST /stories" do
    before do
      sign_in user
    end

    it "Storyを作成できる" do
      expect do
        post stories_path, params: {
          story: {
            title: "肌改善記録",
            description: "テスト説明",
            started_on: Date.current
          }
        }
      end.to change(Story, :count).by(1)

      expect(response).to redirect_to(stories_path)
    end

    it "titleがない場合は作成できない" do
      expect do
        post stories_path, params: {
          story: {
            title: nil,
            description: "テスト説明",
            started_on: Date.current
          }
        }
      end.not_to change(Story, :count)

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
