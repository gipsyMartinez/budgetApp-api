class Budget < ApplicationRecord
  belongs_to :expense
  belongs_to :month
  belongs_to :user
  accepts_nested_attributes_for :expense
end
