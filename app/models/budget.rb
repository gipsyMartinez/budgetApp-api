class Budget < ApplicationRecord
  belongs_to :expense
  belongs_to :user
  has_many :items
  accepts_nested_attributes_for :expense
end
