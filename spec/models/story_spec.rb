require "rails_helper"

RSpec.describe Story, type: :model do
  describe "バリデーション" do
    it "有効なStoryであること" do
      story = build(:story)

      expect(story).to be_valid
    end

    it "titleがない場合は無効であること" do
      story = build(:story, title: nil)

      expect(story).not_to be_valid
    end

    it "started_onがない場合は無効であること" do
      story = build(:story, started_on: nil)

      expect(story).not_to be_valid
    end
  end

  describe "関連付け" do
    it "Userに属していること" do
      association = described_class.reflect_on_association(:user)

      expect(association.macro).to eq :belongs_to
    end

    it "複数のRecordを持てること" do
      association = described_class.reflect_on_association(:records)

      expect(association.macro).to eq :has_many
    end
  end

  describe "#elapsed_days" do
    it "開始日から経過日数を返すこと" do
      story = build(:story, started_on: Date.current - 10.days)

      expect(story.elapsed_days).to eq 11
    end
  end

  describe "#before_record" do
    it "一番古いRecordを返すこと" do
      story = create(:story)

      older_record = create(
        :record,
        story: story,
        recorded_on: Date.current - 5.days
      )

      create(
        :record,
        story: story,
        recorded_on: Date.current
      )

      expect(story.before_record).to eq older_record
    end
  end

  describe "#after_record" do
    it "一番新しいRecordを返すこと" do
      story = create(:story)

      create(
        :record,
        story: story,
        recorded_on: Date.current - 5.days
      )

      newer_record = create(
        :record,
        story: story,
        recorded_on: Date.current
      )

      expect(story.after_record).to eq newer_record
    end
  end
end
