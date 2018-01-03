class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.float :amount
      t.text :description
      t.belongs_to :budget, index: true
      t.timestamps
    end
  end
end
