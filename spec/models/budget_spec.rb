require 'rails_helper'

RSpec.describe Budget, type: :model do
  describe "Relationships" do
    it { should belong_to(:month) }
    it { should belong_to(:expense) }
    it { should belong_to(:user) }
    it { should have_many(:items) }
  end
end
