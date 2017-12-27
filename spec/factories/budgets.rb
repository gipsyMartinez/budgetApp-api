FactoryBot.define do
  factory :budget do
    expense { FactoryBot.create(:expense) }
    month_id { Month.last&.id || FactoryBot.create(:month).id }
    amount { Faker::Number.decimal(5, 2) }
    user_id { User.last&.id || FactoryBot.create(:user).id }
  end
end
