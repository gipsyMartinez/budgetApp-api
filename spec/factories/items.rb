FactoryBot.define do
  factory :item do
    description { FFaker::Lorem.sentence }
    amount { Faker::Number.decimal(5, 2) }
    budget_id { Budget.last&.id || FactoryBot.create(:budget).id }
  end
end
