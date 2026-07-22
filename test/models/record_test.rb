require "test_helper"

class RecordTest < ActiveSupport::TestCase
  test "ストーリーに紐づく経過記録を保存できる" do
    record = Record.new(
      story: stories(:one),
      memo: "肌の赤みが少し引いた",
      recorded_on: Date.today
    )

    assert record.valid?
  end

  test "メモを保存できる" do
    record = Record.create(
      story: stories(:one),
      memo: "ニキビが改善した",
      recorded_on: Date.today
    )

    assert_equal "ニキビが改善した", record.memo
  end

  test "記録日を保存できる" do
    today = Date.today

    record = Record.create(
      story: stories(:one),
      memo: "テスト",
      recorded_on: today
    )

    assert_equal today, record.recorded_on
  end
end