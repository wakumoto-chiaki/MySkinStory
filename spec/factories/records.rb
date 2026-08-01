FactoryBot.define do
  factory :record do
    association :story
    memo { "肌の状態メモ" }
    recorded_on { Date.current }
  end
end
