class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :payment

  MAX_QUANTITY = 3

  validates :quantity, :total, presence: true, numericality: true
  validates :quantity, numericality: { less_than_or_equal_to: MAX_QUANTITY }
end