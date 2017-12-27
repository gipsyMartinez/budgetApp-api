class Budget < ApplicationRecord
  belongs_to :expense
  belongs_to :month
  belongs_to :user
end
