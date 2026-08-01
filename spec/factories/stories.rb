FactoryBot.define do
  factory :story do
    association :user
    title { "肌改善ストーリー" }
    description { "肌変化の記録です" }
    started_on { Date.current }
  end
end
