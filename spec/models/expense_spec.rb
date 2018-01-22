require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe "Relationships" do
    it { should have_many(:budgets) }
  end
end
