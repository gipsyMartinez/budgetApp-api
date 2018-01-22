class Item < ApplicationRecord
  before_create :update_amount, if: :amount?
  belongs_to :budget

  private
    def update_amount
      budget.update(amount: budget.amount - amount)
    end
end
