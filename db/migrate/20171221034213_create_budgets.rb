class CreateBudgets < ActiveRecord::Migration[5.1]
  def change
    create_table :budgets do |t|
      t.belongs_to :month, index: true
      t.belongs_to :expense, index: true
      t.float :amount
      t.timestamps
    end
  end
end
