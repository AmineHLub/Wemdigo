require 'rails_helper'

RSpec.describe Tranzaction, type: :model do
  describe 'Tranzactions model validations' do
    subject do
      Tranzaction.new
    end

    before { subject.save }

    it 'name presence' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'price negative' do
      subject.amount = -5
      expect(subject).to_not be_valid
    end
  end
end
