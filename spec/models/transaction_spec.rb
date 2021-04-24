require 'rspec'

describe Transaction do

  context 'validations' do
    subject {described_class.new}
    it { should validate_presence_of(:quantity) }
    it { should validate_numericality_of(:quantity) }

    it { should validate_presence_of(:total)}
    it { should validate_numericality_of(:total) }

  end
end