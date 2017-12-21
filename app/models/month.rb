class Month < ApplicationRecord
  has_many :budgets
  has_many :expenses, through: :budgets
end
