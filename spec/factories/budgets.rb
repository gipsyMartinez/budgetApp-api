FactoryBot.define do
  factory :budget do
    expense_attributes { FactoryBot.attributes_for(:expense) }
    amount { Faker::Number.decimal(5, 2) }
    user_id { User.last&.id || FactoryBot.create(:user).id }
  end
end
