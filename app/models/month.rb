class Month < ApplicationRecord
  has_many :budgets
  has_many :expenses, through: :budgets
  validates :name, presence: true
end
