require 'rspec'

describe Payment do
  context 'validations' do
    subject {described_class.new}
    it { should validate_presence_of(:ccNum) }
    it { should validate_presence_of(:exp) }

    it { should allow_value("4242424242424242").for(:ccNum) }
    it { should_not allow_value("424242424242424243").for(:ccNum) }

    it { should allow_value("02/12").for(:exp) }
    it { should_not allow_value("023/12").for(:exp) }
  end

end