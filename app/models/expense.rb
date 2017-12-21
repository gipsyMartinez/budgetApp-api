class Expense < ApplicationRecord
  has_many :budgets
  has_many :months, through: :budgets
end
