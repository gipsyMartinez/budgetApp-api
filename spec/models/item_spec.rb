require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "Relationships" do
    it { should belong_to(:budget) }
  end

  describe 'Callbacks' do
    let(:budget){ FactoryBot.create(:budget, amount: 100000.00) }
    describe 'update_amount' do
      before :each do
        budget
      end
      context 'when amount is present' do
        it 'should subtract the budget ammount' do
          FactoryBot.create(:item, budget_id: budget.id, amount: 40000.00)
          budget.reload
          expect(budget.amount).to eq 60000.00
        end
      end
      context 'when amount is not present' do
        it 'should not update the budget amount' do
          FactoryBot.create(:item, budget_id: budget.id, amount: nil)
          expect(budget.amount).to eq 100000.00
        end
      end
    end
  end

end
