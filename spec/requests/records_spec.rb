require "rails_helper"

RSpec.describe "Records", type: :request do
  let(:user) { create(:user) }
  let(:story) { create(:story, user: user) }

  describe "POST /stories/:story_id/records" do
    context "ログインしている場合" do
      before do
        sign_in user
      end

      it "Recordを作成できる" do
        expect do
          post story_records_path(story), params: {
            record: {
              memo: "肌の変化を確認",
              recorded_on: Date.current
            }
          }
        end.to change(Record, :count).by(1)

        expect(response).to redirect_to(story_path(story))
      end

      it "memoがない場合は作成できない" do
        expect do
          post story_records_path(story), params: {
            record: {
              memo: nil,
              recorded_on: Date.current
            }
          }
        end.not_to change(Record, :count)

        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "未ログインの場合" do
    it "ログイン画面へリダイレクトされる" do
      post story_records_path(story), params: {
        record: {
          memo: "テスト",
          recorded_on: Date.current
        }
      }

      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
