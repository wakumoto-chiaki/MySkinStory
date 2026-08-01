require "rails_helper"

RSpec.describe Record, type: :model do
  describe "バリデーション" do
    it "有効なRecordであること" do
      record = build(:record)

      expect(record).to be_valid
    end

    it "memoがない場合は無効であること" do
      record = build(:record, memo: nil)

      expect(record).not_to be_valid
    end

    it "recorded_onがない場合は無効であること" do
      record = build(:record, recorded_on: nil)

      expect(record).not_to be_valid
    end
  end

  describe "関連付け" do
    it "Storyに属していること" do
      association = described_class.reflect_on_association(:story)

      expect(association.macro).to eq :belongs_to
    end
  end

  describe "画像添付" do
    it "画像を添付できること" do
      record = build(:record)

      record.image.attach(
        io: File.open(Rails.root.join("spec/fixtures/files/test_image.png")),
        filename: "test_image.png",
        content_type: "image/png"
      )

      expect(record.image).to be_attached
    end
  end
end
