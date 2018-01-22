class RemoveMonthFromBudgets < ActiveRecord::Migration[5.1]
  def change
    remove_column :budgets, :month_id
  end
end
