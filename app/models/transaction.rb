class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :payment

  validates :quantity, :total, presence: true, numericality: true
end