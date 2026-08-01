require "rails_helper"

RSpec.describe User, type: :model do
  describe "バリデーション" do
    it "有効なユーザーであること" do
      user = build(:user)

      expect(user).to be_valid
    end

    it "名前がない場合は無効であること" do
      user = build(:user, name: nil)

      expect(user).not_to be_valid
    end

    it "名前が30文字以下であること" do
      user = build(:user, name: "a" * 30)

      expect(user).to be_valid
    end

    it "名前が31文字以上の場合は無効であること" do
      user = build(:user, name: "a" * 31)

      expect(user).not_to be_valid
    end
  end

  describe "関連付け" do
    it "複数のStoryを持てること" do
      association = described_class.reflect_on_association(:stories)

      expect(association.macro).to eq :has_many
    end
  end
end
