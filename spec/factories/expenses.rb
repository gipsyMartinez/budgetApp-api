FactoryBot.define do
  factory :expense do
    title { FFaker::Lorem.word }
    description { FFaker::Lorem.sentence }
  end
end
