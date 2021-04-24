class Payment < ApplicationRecord
  belongs_to :user
  validates :ccNum, :exp, presence: true
  validates :ccNum, :format => { :with => /\A[0-9]{16}\z/, :message => "Not a valid 16 digit credit card" }
  validates :exp, :format => { :with => /\A\d{2}\/\d{2}\z/, :message => "expiry should be MM/DD" }

end
