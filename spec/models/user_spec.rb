require 'rspec'

describe User do

  context 'validations' do
    subject { described_class.new }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

end