require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe "Relationships" do
    it { should have_many(:months) }
    it { should have_many(:months).through(:budgets) }
  end
end
