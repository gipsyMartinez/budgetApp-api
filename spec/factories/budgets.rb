FactoryBot.define do
  factory :budget do
    expense_id { Expense.last&.id || FactoryBot.create(:expense).id }
    month_id { Month.last&.id || FactoryBot.create(:month).id }
    amount { Faker::Number.decimal(5, 2) }
    user_id { User.last&.id || FactoryBot.create(:user).id }
  end
end
