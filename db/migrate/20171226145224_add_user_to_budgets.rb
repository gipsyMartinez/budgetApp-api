class AddUserToBudgets < ActiveRecord::Migration[5.1]
  def change
    add_column :budgets, :user_id, :integer, index: true
  end
end
