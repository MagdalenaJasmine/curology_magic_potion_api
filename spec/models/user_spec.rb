require 'rspec'

describe User do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end
  context 'when a user with the same email exists' do
    subject { described_class.new }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

end